echo -e '\t Written by Tahinli'
loadkeys trq
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
#need to implement edition of  locale.gen
#locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo tArch > /etc/hostname
echo -e '127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\ttArch' | tee -a /etc/hosts
#need to implement edition of /etc/pacman.conf to parallel download
#need to implement multilib /etc/pacman.conf
pacman -Syyu
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S git
pacman -S grub
pacman -S efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi
#grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sddm
systemctl enable sddm
pacman -S bash-completion
useradd -m -G whell tahinli
#need to implement maybe passwd tahinli
#need to implement uncomment wheel in visudo - EDITOR=nano visudo
pacman -S plasma-desktop
pacman -S htop
pacman -S alacritty
pacman -S neofetch
pacman -S xorg
pacman -S firefox
pacman -S plasma-pa
pacman -S alsa
##Add Nvidia Hook
pacman -S nvidia-dkms
pacman -S nvidia-settings
pacman -S linux-zen
pacman -S linux-zen-headers
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
pacman -S ttf-liberation 
pacman -S ncspot
pacman -S kdeconnect
pacman -S wget
pacman -S fuse#app image
pacman -S python-pip
pacman -S fish
pacman -S cargo
pacman -S traceroute
pacman -S partitionmanager
pacman -S steam
#GOverlay
pacman -S mesa-demos
pacman -S vulkan-tools
pacman -S qt5pas
pacman -S lazarus
#Do not forget to clone
##GOverlay
#mangohud
pacman -S gcc
pacman -S meson
pacman -S ninja
pacman -S glslang
pacman -S vulkan-headers
pacman -S libgl
pacman -S libegl
pacman -S libx11
pacman -S libxnvctrl
pacman -S libdbus
pacman -S mako
#Do not forget to clone
##mangohud
pacman -S flameshot
pacman -S pinta
pacman -S ark
#Define&Spell
pacman -S hunspell
pacman -S hunspell-en_gb
pacman -S hspell
pacman -S aspell
pacman -S kdeplasma-addons
##Define&Spell
#ButterManager
pacman -S python-setuptools
pacman -S python-virtualenv
pacman -S grub-btrfs
pacman -S libxinerama
pacman -S tk
pacman -S python-pyqt5
pacman -S python-yaml
pacman -S sip
##ButterManager
pacman -S gwenview
pacman -S code
pacman -S obs-studio
pacman -S vlc
pacman -S cronie
systemctl enable cronie
#wget hifile dont forget
