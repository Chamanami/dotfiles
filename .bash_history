curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
sudo pacman gum
sudo pacman -S gum
sudo pacman -S gum
yay -S gum
curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
sudo pacman -S reflector --noconfirm
sudo reflector --country Serbia --age 25 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
sudo pacman -S gum
curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
curl -fsSL -o install.sh https://raw.githubusercontent.com/BinaryHarbinger/hyprdots/main/install.sh && chmod +x install.sh && ./install.sh
sudo pacman -S paru
yay -S paru
pacman -Syu pipewire-media-session
sudo pacman -Syu pipewire-media-session
sudo pacman -Rns wireplumber
systemctl --user status pipewire pipewire-pulse wireplumber
sudo pacman -S pipewire-alsa alsa-card-profile --needed
sudo pacman -S pipewire-alsa alsa-card-profile
sudo pacman -S pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber alsa-utils --needed
sudo pacman -Rns pulseaudio pulseaudio-bluetooth
sudo pacman -Rdd pulseaudio pulseaudio-bluetooth && sudo pacman -S pipewire-pulse
sudo pacman -S pipewire pipewire-alsa wireplumber alsa-utils --needed
systemctl --user daemon-reexec
systemctl --user restart pipewire wireplumber
reboot
sudo pacman -S flatpak
flatpak run com.ml4w.dotfilesinstaller
sudo pacman -S libxm12
yay -S dotfilesinstaller
yay -S dotfiles_installer
yay -S dotfilesinstaller
pacman -Qs libgpgme
ls -l /usr/lib/libgpgme.so*
curl -O https://archive.archlinux.org/packages/l/libgpgme/libgpgme-1.14.0-1-x86_64.pkg.tar.zst
mkdir /tmp/libgpgme-old
tar -I zstd -xf libgpgme-1.14.0-1-x86_64.pkg.tar.zst -C /tmp/libgpgme-old
which zstd
zstd --version
tar --use-compress-program=unzstd -xf libgpgme-1.14.0-1-x86_64.pkg.tar.zst -C /tmp/libgpgme-old
tar -I unzstd -xf libgpgme-1.14.0-1-x86_64.pkg.tar.zst -C /tmp/libgpgme-old
ls -lh libgpgme-1.14.0-1-x86_64.pkg.tar.zst
wget https://archive.archlinux.org/packages/l/libgpgme/libgpgme-1.14.0-1-x86_64.pkg.tar.zst -O libgpgme-1.14.0-1-x86_64.pkg.tar.zst
curl -o libgpgme-so11.tar.gz https://transfer.sh/get/libgpgme-so11.tar.gz
curl -L -o libgpgme-1.14.0-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/l/libgpgme/libgpgme-1.14.0-1-x86_64.pkg.tar.zst
tar -I unzstd -xf libgpgme-1.14.0-1-x86_64.pkg.tar.zst -C /tmp/libgpgme-old
sudo tar -I unzstd -xf libgpgme-1.14.0-1-x86_64.pkg.tar.zst -C /tmp/libgpgme-old
unzstd libgpgme-1.14.0-1-x86_64.pkg.tar.zst -o libgpgme-1.14.0-1-x86_64.pkg.tar
ls -lh libgpgme-1.14.0-1-x86_64.pkg.tar.zst
file libgpgme-1.14.0-1-x86_64.pkg.tar.zst
ln -s /usr/lib/libgpgme.so /usr/lib/libgpgme.so.11
sudo ln -s /usr/lib/libgpgme.so /usr/lib/libgpgme.so.11
pacman -V
pacman -Syu
curl -L -o libgpgme-1.14.0-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/l/libgpgme/libgpgme-1.14.0-1-x86_64.pkg.tar.zst
file libgpgme-1.14.0-1-x86_64.pkg.tar.zst
ls -lh libgpgme-1.14.0-1-x86_64.pkg.tar.zst
curl -o libgpgme.so.11.tar.gz https://transfer.sh/get/libgpgme.so.11.tar.gz
sudo pacman -Syu
sudo pacman -Rdd electron32 hyprutils-git
sudo pacman -Syu
sudo rm -r /usr/lib/firmware/nvidia/ad10{3,4,6,7}
sudo pacman -Syu
sudo pacman -S electron32 hyprutils
sudo pacman -S electron32 hyprutils
yay -S electron32
sudo reboot
powertop
sudo powertop
tlp
auto-cpufreq --live
sudo auto-cpufreq --uninstall
auto-cpufreq
sudo systemctl status auto-cpufreq
sudo systemctl status auto-cpufreq
sudo systemctl disable --now auto-cpufreq
sudo rm -f /usr/lib/systemd/system/auto-cpufreq.service
sudo rm -f /usr/bin/auto-cpufreq
sudo rm -f /usr/local/bin/auto-cpufreq
whereis auto-cpufreq
pip show auto-cpufreq
sudo pip show auto-cpufreq
pip uninstall auto-cpufreq
sudo pip uninstall auto-cpufreq
which auto-cpufreq
sudo pacman -S power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon
powerprofilesctl
powertop
sudo powettop
sudo powertop
sudo cpupower frequency-set -g balanced
sudo powertop
powerprofilesctl
powerprofilesctl set power-saver
sudo powertop
powerprofilesctl
sudo powertop
poweroff
ls
ls -al
cd ,config
cd .config
ls
cd hypr/
ls
atom hyprland.conf 
atom-ng hyprland.conf 
lsusb
sudo pacman -S usbutils
lsusb
xinput list
echo $XDG_CURRENT_DESKTOP
hyprctl devices
sudo pacman -S swww
cd Pictures/
ls
poweroff
sudo powertop
sudo pacman -S qview
yay -S qview
cd Pictures/
qview arch_nz.png 
qview Background.png 
qview E30.png 
qview JylGcDt.png 
qview wallpaperflare.com_wallpaper.jpg 
qview dojo.png 
qview
poweroff
sudo pacman -Rns power-profiles-daemon
sudo pacman -S tlp tlp-rdw
sudo systemctl enable tlp --now
tlp-stat -s
sudo systemctl disable power-profiles-daemon.service
tlp-stat -s
sudo systemctl enable tlp --now
tlp-stat -s
sudo nano /etc/tlp.conf
tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
cd .config
cd hypr/
ls
gedit hyprpaper.conf &
sudo hyprctl hyprpaper reload ,"~/Pictures/moon.png"
hyprctl hyprpaper reload ,"~/Pictures/moon.png"
which htop
killall waybar
gedit .config/waybar/style.css &
gedit .config/waybar/config &
cd .config
cd waybar/
ls
cd scripts/
ls -al
chmod +x ~/.config/waybar/scripts/*.sh
chmod +x ~/.config/waybar/scripts/workspaces/*.sh
killall waybar
ls
gedit volume.sh &
killall waybar
gedit asus-profile.sh &
ls
rm asus-profile.sh 
ls
cd ..
gedit config &
gedit style.css &
gedit config 
chmod +x uptime.sh
chmod +x "uptime.sh"
cd scripts/
chmod +x uptime.sh
killall waybar
waybar &
killall waybar
waybar &
killall waybar
waybar &
killall waybar
waybar &
killall waybar
waybar &
which brightnessctl
which playerctl
which wpctl
which pactl
which Nerd Font
yay -S Nerd Font
sudo pacman -Ss
sudo pacman -S ttf-nerd-font
cd Downloads/
ls
ls -al
unzip CascadiaMono.zip 
sudo cp CaskaydiaMonoNerdFont-Regular.ttf /usr/share/fonts/TTF
sudo fc-cache -fv
which Caskadyia
cd
which Caskaydia
fc-list | grep "Caskaydia"
ls
pwd
killall waybar
waybar &
[A
waybar &
waybar &
waybar &
sudo pacman -S bc awk seq printf
sudo pacman -S bc
yay -S seq printf
sudo pacman -S jq
waybar &
waybar &
gedit .config/waybar/style.css config &
sudo pacman -S blueman-manager
yay -S blueman-manager
sudo pacman -S blueman
killall waybar
waybar &
sudo reboot
which tlp
tlp status
tlp stats
tlp-stat -s
tlp-stat -b
sudo tlp-stat -b
sudo powertop
sudo powertop
sudo powertop
    cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sudo powertop
powertop --html=powerreport.html
sudo powertop --html=powerreport.html
firefox powerreport.html &
poweroff
cd .config
ll
ls 
cd kitty/
ls
gedit kitty.conf &
cd
ls
ls -al
gedit .bashrc &
source ~/.bashrc
ll
cd .config
ll
cd hypr/
ls
gedit hyprland.conf &
sudo nm-connection-editor
cd .config/
ls
ll
cd rofi
ll
gedi config.rasi &
gedit config.rasi &
cd ..
l
ll
cd hypr/
gedit hyprland.conf &
sudo pacman -S vscode
sudo pacman -S docker tmux spotify
sudo pacman -S docker tmux
yay -S spotify
cd .config/waybar/
ls
ll
gedit config &
sudo nm-connection-editor
sudo nm-connection-editor
tlp-stats -b
tlp-status -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo tlp-stat -b
sudo powertop
poweroff
xrandr | grep "*"
xrandr | grep "*"
cd .config
cd hypr/
gedit hyprpaper.conf &
hyprctl hyprpaper reload ,"~/Pictures/Torii.png"
ll
l
ll
sudo pacman -S git
neofetch
;;
ll
ll
ls -al
ll
ll
cd .config/
cd kitty
;;
ll
neofetch
ll
ll
ll
ll
ll
ll
ll
ll
ll
ll
ll
ls -al
ll
ll
cd .config
cd kitty/
ll
gedit kitty.conf &
fc-list
fc-list :family
fc-list :family | grep "nerd"
fc-list :family | grep "Nerd"
fc-list :family | grep "DejaVu"
fc-list :family | grep "Noto"
fc-list :family | grep "Sans"
fc-list :family | grep "Source"
ll
systemctl status display-manager
sudo gdm-settings
gdm-settings
yay -S gdm-settings
sudo reboot
gdm-settings
sudo reboot
sudo pacman -S gimp
cd usr
cd ..
ll
cd ..
ll
cd usr
cd share
l
ll
cd gnome-shell/
ll
cd gir-1.0/
l
ll
cd ..
cd theme
cd ..
ll
cd gnome-session/
ll
cd ..
ll
code &
ll
cd ..
ll
cd
poweroff
poweroff
sudo pacman -S discord
sudo powertop
poweroff
sudo pacman -S okular
sudo pacman -S xreader
sudo pacman -S shutter
sudo pacman -Rns shutter
sudo pacman -S flameshot
flameshot gui
flameshot gui
flameshot gui
flameshot gui
flameshot gui
flameshot gui
flameshot gui
flameshot gui
flameshot gui
ll
cd .config
cd hy
cd hypr/
gedit hyprland.conf &
which flameshot
hyprctl reload
cd ..
..
ll
cd flameshot
ll
nano flameshot.ini 
flameshot gui
nano flameshot.ini 
cat flameshot.ini 
flameshot gui
cd /usr/bin/
ll
ll | grep "flameshot"
nano flameshot 
./flameshot
flameshot gui
flameshot gui
which flameshot gui
which "flameshot gui"
cd
which "flameshot gui"
hyprctl keyevents
sudo hyprctl keyevents
evtest
sudo pacman -S evtest
evtest
sudo evtest
hyprctl reload
hyprctl reload
hyprctl reload
hyprctl reload
sudo pacman -Rns flameshot
sudo pacman -Rns flameshot
yay -S flameshot-git
flameshot
flameshot gui
which flameshot
cd /usr/bin/flameshot
cd .config
cd flameshot/
ll
nano flameshot.ini 
sudo pacman -S grim slurp
flameshot gui
sudo reboot
poweroff
poweroff
poweroff
poweroff
ll
cd .config
ll
cd kitty/
ll
nano kitty.conf
cd..
ll
cd ..
ll
cd
ll
cd .bashrc 
ll
cd .bashrc
nano .bashrc
source ~/.bashrc
teams &
sudo pacman -S teams
nano .bashrc 
source ~/.bashrc
teams &
teams &
teams &
nano .bashrc 
hyprctl dispatch workspace 2
nano .bashrc 
source ~/.bashrc
teams &
nano .bashrc 
source ~/.bashrc
teams &
poweroff
teams &
ll
nano .bashrc 
source ~/.bashrc
teams &
teams &
nano .bashrc
source ~/.bashrc
teams &
disown
poweroff
sudo pacman -S git
