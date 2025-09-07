echo '	---> Tahinli Fedora Easy Ready Script <---'
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'fastestmirror=TRUE' | sudo tee -a /etc/dnf/dnf.conf
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo -e '0) Kernel Check and Restart\n1) Bypass Kernel Control and Continue to Install'
read selection
case $selection in
0)
echo -e '\nKernel Update Selected\n Checking...\n'
sudo dnf update -y
reboot
;;
1)
echo -e '\n Installation Selected\n Starting...\n'
sudo dnf install -y alsa-lib
echo 'options snd-hda-intel index=0 model=dell-headset-multi' | sudo tee -a /etc/modprobe.d/alsa-base.conf
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'
sudo dnf install -y github-desktop
sudo dnf install -y discord
sudo dnf install -y steam
sudo dnf install -y akmod-nvidia
sudo dnf install -y xorg-x11-drv-nvidia-cuda
sudo dnf install -y neofetch
sudo dnf install -y alacritty
sudo dnf install -y --allowerasing obs-studio
sudo dnf install -y audacity
sudo dnf install -y grub-customizer
sudo dnf install -y lpf-spotify-client
lpf update
echo -e '	-< Installation is Done, Please Restart >-'
;;
*)
echo -e '	-# Invalid Selection #-\n		QUITING';;
esac
