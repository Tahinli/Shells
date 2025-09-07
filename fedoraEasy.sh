#!/bin/bash
echo '	---> Tahinli Fedora Easy Ready Script <---'

function fastDNF
	{
		echo -e '\n-->Fast DNF Selected\n'
		echo -e '# see `man dnf.conf` for defaults and possible options\n#Edited by Tahinli\n\n[main]\ngpgcheck=True\ninstallonly_limit=3\nclean_requirements_on_remove=True\nbest=False\nskip_if_unavailable=True\nmax_parallel_downloads=10\nfastestmirror=TRUE' | sudo tee /etc/dnf/dnf.conf
	}
function rpmFusion
	{
		echo -e '\n-->RPM-Fusion Selected\n'
		sudo dnf install -y --allowerasing https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	}
function additionalRepo
	{
		echo -e '\n-->Additional Repo Selected\n'
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
		sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
		sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
		sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'
		sudo dnf check-update
	}
function configFix
	{
		echo -e '\n-->Config Fix Selected\n'
		echo 'options snd-hda-intel index=0 model=dell-headset-multi' | sudo tee /etc/modprobe.d/alsa-base.conf
		echo -e '#This file is provided by xorg-x11-drv-nvidia\n#Edited by Tahinli\n\nSection "OutputClass"\n\tIdentifier "nvidia"\n\tMatchDriver "nvidia-drm"\n\tDriver "nvidia"\n\tOption "AllowEmptyInitialConfiguration"\n\tOption "SLI" "Auto"\n\tOption "BaseMosaic" "on"\n\tOption "PrimaryGPU" "yes"\nEndSection\n\nSection "ServerLayout"\n\tIdentifier "layout"\n\tOption "AllowNVIDIAGPUScreens"\n\tOption "PrimaryGPU" "yes"\nEndSection\n' | sudo tee /etc/X11/xorg.conf.d/nvidia.conf
	}
function kernelCheck
	{
		echo -e '\n-->Kernel Update Selected\n Checking...\n'
		sudo dnf update -y
	}
function cleaning
	{
		echo -e '\n-->Cleaning Selected\n'
		sudo dnf autoremove -y
		sudo dnf clean all -y
	}
function installation
	{
		echo -e '\n Installation Selected\n Starting...\n'
		sudo dnf install -y --allowerasing alsa-lib
		sudo dnf install -y --allowerasing code
		sudo dnf install -y --allowerasing github-desktop
		sudo dnf install -y --allowerasing discord
		sudo dnf install -y --allowerasing steam
		sudo dnf install -y --allowerasing gamemode
		sudo dnf install -y --allowerasing mangohud
		sudo dnf install -y --allowerasing goverlay
		sudo dnf install -y --allowerasing akmod-nvidia
		sudo dnf install -y --allowerasing xorg-x11-drv-nvidia-cuda
		sudo dnf install -y --allowerasing neofetch
		sudo dnf install -y --allowerasing alacritty
		sudo dnf install -y --allowerasing obs-studio
		sudo dnf install -y --allowerasing audacity
		sudo dnf install -y --allowerasing lutris
		sudo dnf install -y --allowerasing timeshift
		sudo dnf install -y --allowerasing lpf-spotify-client
		lpf update
		echo -e '	-< Installation is Done, Please Restart >-'
	}
function restartSelection
	{
		echo -e '	Do You Want To Restart, If Kernel is Updated Recently or Installed Drivers Please Restart\n	0)Restart\n	1)Do not Restart'
		read restartC
		case $restartC in
		0)
			echo 'Restart is Selected'
			reboot
			;;
		1)
			echo 'Do not Restart is Selected'
			;;
		esac
	}
echo -e '0) Kernel Uptade Check\n1) Hands Free Complete Setup\n2) Only Fix Config Files\n3) Only Speed Up DNF\n4) Only Activate RPM-Fusion Repos\n5) Only Add Additional Repos\n6) Only Install Programs\n7) Only Cleaning'
read selection
case $selection in
	0)
		kernelCheck
		;;
	1)
		fastDNF
		rpmFusion
		additionalRepo
		configFix
		installation
		cleaning
		;;
	2)
		configFix
		;;
	3)
		fastDNF
		;;
	4)
		rpmFusion
		;;
	5)
		additionalRepo
		;;
	6)
		installation
		;;
	7)
		cleaning
		;;
	*)
		echo -e '	-# Invalid Selection #-\n		QUITING'
		;;
esac
restartSelection
