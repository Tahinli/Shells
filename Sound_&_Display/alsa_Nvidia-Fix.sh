echo '   ---> Tahinli Display and Sound Script <---'
echo -e '1)Nvidia Only Fix\n2)Sound Fix'
read selection
case $selection in
1)
sudo cp -p 10-nvidia-drm-outputclass.conf /etc/X11/xorg.conf.d/nvidia-drm-outputclass.conf;;
2)
sudo cp -p alsa-base.conf /etc/modprobe.d/alsa-base.conf;;
esac

