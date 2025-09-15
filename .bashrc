#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al'
alias teams='firefox https://teams.microsoft.com/v2/'


PS1='[\u@\h \W]\$ '
export LC_TIME="sr_RS.UTF-8"
