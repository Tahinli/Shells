echo -e '   --->Tahinli Linux Easy Config Fixer<---\n'
function restartSelection
	{
		echo -e '	|#|Do You Want to Restart System\n0) Restart\n1) Do not Restart\n'
		read restartCheck
		case $restartCheck in
		0)
			echo -e '\n	|»|Restarting\n'
			reboot
			;;
		1)
			echo -e '\n	|»|Do not Restart Selected\n'
			;;
		esac
	}
echo -e '1) Discrete Nvidia GPU as a Primary\n2) Integrated GPU as a Primary\n3) Alsa Headset Detection Fix\n'
read selection
case $selection in
1)
	echo -e '	#Discrete Nvidia GPU as a Primary Selected\n'
	echo -e '#This file is provided by xorg-x11-drv-nvidia\n#Edited by Tahinli\n\nSection "OutputClass"\n\tIdentifier "nvidia"\n\tMatchDriver "nvidia-drm"\n\tDriver "nvidia"\n\tOption "AllowEmptyInitialConfiguration"\n\tOption "SLI" "Auto"\n\tOption "BaseMosaic" "on"\n\tOption "PrimaryGPU" "yes"\n\tOption "Coolbits" "12"\nEndSection\n\nSection "ServerLayout"\n\tIdentifier "layout"\n\tOption "AllowNVIDIAGPUScreens"\n\tOption "PrimaryGPU" "yes"\nEndSection\n' | sudo tee /etc/X11/xorg.conf.d/nvidia.conf
	;;
2)
	echo -e '	#Integrated GPU as a Primary Selected\n'
	echo -e '#This file is provided by xorg-x11-drv-nvidia\n#Edited by Tahinli\n\nSection "OutputClass"\n\tIdentifier "nvidia"\n\tMatchDriver "nvidia-drm"\n\tDriver "nvidia"\n\tOption "AllowEmptyInitialConfiguration"\n\tOption "SLI" "Auto"\n\tOption "BaseMosaic" "on"\n\tOption "PrimaryGPU" "no"\n\tOption "Coolbits" "12"\nEndSection\n\nSection "ServerLayout"\n\tIdentifier "layout"\n\tOption "AllowNVIDIAGPUScreens"\n\tOption "PrimaryGPU" "no"\nEndSection\n' | sudo tee /etc/X11/xorg.conf.d/nvidia.conf
	;;
3)
	echo -e '	#Alsa Headset Detectetion Fix Selected\n'
	echo 'options snd-hda-intel index=0 model=dell-headset-multi' | sudo tee /etc/modprobe.d/alsa-base.conf
	;;
*)
	echo -e '	---Invalid Selection\n		Quiting'
	;;
esac
if [[ $selection > 0 ]] && [[ $selection < 3 ]];
then
	restartSelection
fi
