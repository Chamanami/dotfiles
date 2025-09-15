/*
 * fin_proc.cpp
 *
 *  Created on: Dec 12, 2024
 *      Author: Mladen Bazina
 */

#include "xtensa/tie/ae_f32.hpp"
#define _CRT_SECURE_NO_WARNINGS
#include "fin_proc.h"
#include "haos.h"
#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <xtensa/tie/xt_hifi4.h>

#define NumOutCh 3
#define NumInCh 2

ae_f32 a_p_rec;
ae_f32 b_p_rec;
ae_f32 a_n_rec;
ae_f32 b_n_rec;

ae_f32 sampleBuffer_fin[MAX_NUM_CHANNEL][BLOCK_SIZE];
int out_mask = 0x00000000;
int in_mask = 0x00000003;

ae_f32 dB_to_factor(int dB) {
  return (ae_f32)pow(10.0,
                     dB / 20.0); // Prebacivanje decibela u linearni faktor
}

void multitap_echo_init(EchoState *echoState, ae_f32 buffer[],
                        const int echoBufLen, const int delay[],
                        const ae_f32 inputGain, const ae_f32 tapGain[],
                        const int nTap) {
  int i;
  for (i = 0; i < echoBufLen; i++) {
    buffer[i] = 0.0;
  }
  echoState->pEchoBuff = buffer;
  echoState->bufferLength = echoBufLen;
  echoState->writeIndex = echoBufLen - 1;
  echoState->inputGain = inputGain;
  echoState->nTap = nTap;
  for (i = 0; i < nTap; i++) {
    echoState->delay[i] = delay[i];
    echoState->readIndex[i] = echoBufLen - 1 - delay[i];
    echoState->tapGain[i] = tapGain[i];
  }
}

void multitap_echo(ae_f32 *pInbuf, ae_f32 *pOutbuf, int inputLen,
                   EchoState *echoState) {
  int i, j;

  for (i = 0; i < inputLen; i++) {
    echoState->pEchoBuff[echoState->writeIndex] = pInbuf[i];
    echoState->writeIndex =
        (echoState->writeIndex + 1) % echoState->bufferLength;

    pOutbuf[i] = pInbuf[i] * echoState->inputGain;
    for (j = 0; j < echoState->nTap; j++) {
      pOutbuf[i] +=
          echoState->tapGain[j] * echoState->pEchoBuff[echoState->readIndex[j]];
      echoState->readIndex[j] =
          (echoState->readIndex[j] + 1) % echoState->bufferLength;
    }
  }
}

static void audio_compressor_init(AudioCompressor_t *compressor) {
  compressor->ratio = 1.0;
  compressor->threshold = 0.0;
  compressor->characteristics = CHARACTERISTICS_HARD_KNEE;
}

static void gst_audio_dynamic_transform_compressor_ae_f32(
    AudioCompressor_t *compressor, ae_f32 *data, unsigned int num_samples) {
  ae_f32 val, threshold = compressor->threshold;
  int i;

  if ((double)compressor->ratio == 1.0)
    return;

  if (compressor->characteristics == CHARACTERISTICS_HARD_KNEE) {
    for (i = 0; i < num_samples; i++) {
      val = data[i];

      if (val > threshold) {
        val = threshold + (val - threshold) * compressor->ratio;
      } else if (AE_F32X2_LT_F32X2(val, AE_F32X2_NEGS(threshold))) {
        val = AE_F32X2_NEGS(threshold) + (val + threshold) * compressor->ratio;
      }
      data[i] = (ae_f32)val;
    }

  } else {
    ae_f32 a_p, b_p, c_p;
    ae_f32 a_n, b_n, c_n;

    if ((double)threshold == 1.0)
      threshold = 1.0 + 0.00001;

    a_p = ((ae_f32)1.0 - compressor->ratio) * a_p_rec;
    b_p = (compressor->ratio * threshold - (ae_f32)1.0) * b_p_rec;
    c_p = threshold * ((ae_f32)1.0 - b_p - a_p * threshold);
    a_n = ((ae_f32)1.0 - compressor->ratio) * a_n_rec;
    b_n =
        (AE_F32X2_NEGS(compressor->ratio) * threshold + (ae_f32)1.0) * b_n_rec;
    c_n = AE_F32X2_NEGS(threshold) * ((ae_f32)1.0 - b_n + a_n * threshold);

    for (i = 0; i < num_samples; i++) {
      val = data[i];

      if ((double)val > 1.0) {
        val = (ae_f32)1.0 + (val - (ae_f32)1.0) * compressor->ratio;
      } else if (val > threshold) {
        val = a_p * val * val + b_p * val + c_p;
      } else if (AE_F32X2_LT_F32X2(val, (ae_f32)-1.0)) {
        val = (ae_f32)-1.0 + (val + (ae_f32)1.0) * compressor->ratio;
      } else if (AE_F32X2_LT_F32X2(val, AE_F32X2_NEGS(threshold))) {
        val = a_n * val * val + b_n * val + c_n;
      }
      data[i] = (ae_f32)val;
    }
  }
}

struct {

  int enabled;
  ae_f32 input_gain;
  ae_f32 headroom_gain;
  int output_mode;

} Fin_mcv = {

    1, 0.5, 0.7, 2

};

HAOS_Mct_t Fin_mct = {0, 0, 0, 0, Fin_Brick, 0, 0, 0, 0};

HAOS_Mif_t Fin_mif = {&Fin_mcv, &Fin_mct};

void Fin_Postkick() {}

void Fin_Brick() {

  if (Fin_mcv.enabled) {
    uint32_t blockSize = BLOCK_SIZE;
    int32_t maxNumChannels = MAX_NUM_CHANNEL;

    int echoBufLen = 2048; // Length of the echo buffer (circular buffer)
    int delay[] = {100, 200,  400,  600,
                   800, 1000, 1200, 1500}; // Kašnjenje u uzorcima
    ae_f32 tapGain[] = {0.7,  0.5, 0.4,  0.3,
                        0.25, 0.2, 0.15, 0.1}; // Pojačanje za svaki tap
    ae_f32 inputGain = 1.0;                    // Pojačanje za ulaz

    EchoState echoState;

    multitap_echo_init(&echoState,
                       (ae_f32 *)malloc(echoBufLen * sizeof(ae_f32)),
                       echoBufLen, delay, inputGain, tapGain, N_TAP);

    AudioCompressor_t compressor;
    audio_compressor_init(&compressor);

    compressor.ratio = 0.2;
    compressor.threshold = 0.1;
    compressor.threshold_neg = AE_F32X2_NEGS(compressor.threshold);

    //(-threshold + 1.0);

    a_p_rec = (ae_f32)(1 / (2 * ((double)compressor.threshold - 1)));
    b_p_rec = (ae_f32)(1 / ((double)compressor.threshold - 1));

    a_n_rec = (ae_f32)(1 / (2 * (double)compressor.threshold_neg) + 1);
    b_n_rec = (ae_f32)(1 / ((double)compressor.threshold_neg + 1));

    compressor.characteristics = CHARACTERISTICS_HARD_KNEE;

    // Processing loop
    //-------------------------------------------------
    {
      int32_t sample;

      int mask = __HAOS_PPM_VALID_CHANNELS;
      int channel = 0;

      while (mask != 0) {
        if (mask & 1) {
          for (int32_t j = 0; j < blockSize; j++) {

            sampleBuffer_fin[channel][j] =
                __HAOS_IOBUFFER_PTRS[channel][j] * Fin_mcv.input_gain;
          }
        }
        mask >>= 1;
        channel++;
      }

      for (int32_t j = 0; j < blockSize; j++) {
        sampleBuffer_fin[2][j] = sampleBuffer_fin[1][j];
        sampleBuffer_fin[1][j] = 0;
        sampleBuffer_fin[1][j] =
            (sampleBuffer_fin[0][j] + sampleBuffer_fin[2][j]) *
            Fin_mcv.headroom_gain; // Kako je sada ostavljen prostor za
                                   // centralni kanal, mozemo odma da uradimo
                                   // korak sabiranja i slabljenja
      }

      multitap_echo(sampleBuffer_fin[0], sampleBuffer_fin[0], blockSize,
                    &echoState);
      gst_audio_dynamic_transform_compressor_ae_f32(
          &compressor, sampleBuffer_fin[2], blockSize);

      for (int32_t j = 0; j < blockSize; j++) {
        sampleBuffer_fin[2][j] = sampleBuffer_fin[2][j] *
                                 dB_to_factor(-2); // Utisavanje kanala za 2dB
      }

      mask = __HAOS_PPM_VALID_CHANNELS;
      channel = 0;
      while (mask != 0) {
        if (mask & 1) {
          for (int32_t j = 0; j < blockSize; j++) {
            __HAOS_IOBUFFER_PTRS[channel][j] = sampleBuffer_fin[channel][j];
          }
        }
        mask >>= 1;
        channel++;
      }
    }

    // Close files
    //-------------------------------------------------
  }
}
//==============================================================================
