echo -e '   --->Tahinli Linux Easy Config Fixer<---\n'
echo -e '1) Nvidia Primary Fix\n2) Alsa Headset Detection Fix\n'
read selection
case $selection in
1)
	echo -e '	#Nvidia Primary Fix Selected\n'
	echo -e '#This file is provided by xorg-x11-drv-nvidia\n#Edited by Tahinli\n\nSection "OutputClass"\n\tIdentifier "nvidia"\n\tMatchDriver "nvidia-drm"\n\tDriver "nvidia"\n\tOption "AllowEmptyInitialConfiguration"\n\tOption "SLI" "Auto"\n\tOption "BaseMosaic" "on"\n\tOption "PrimaryGPU" "yes"\nEndSection\n\nSection "ServerLayout"\n\tIdentifier "layout"\n\tOption "AllowNVIDIAGPUScreens"\n\tOption "PrimaryGPU" "yes"\nEndSection\n' | sudo tee /etc/X11/xorg.conf.d/nvidia.conf
	;;
2)
	echo -e '	#Alsa Headset Detectetion Fix Selected\n'
	echo 'options snd-hda-intel index=0 model=dell-headset-multi' | sudo tee /etc/modprobe.d/alsa-base.conf
	;;
*)
	echo -e '	---Invalid Selection\n		Quiting'
	;;
esac
