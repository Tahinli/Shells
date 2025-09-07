echo "<--##Tahinli Resolution Script##-->"
echo "   1- Standart Resolution"
echo "   2- First Monitor Only"
echo "   3- Second Monitor Only"
read selection
case $selection in
  1)xrandr --output HDMI-0 --mode 1920x1080 --right-of eDP-1-1  -r 75 --rotate right
    xrandr --output eDP-1-1 --mode 1920x1080 --left-of HDMI-0 -r 144 --rotate normal;;
  2)xrandr --output HDMI-0 --off;;
  3)xrandr --output HDMI-0 --mode 1920x1080 --right-of eDP-1-1  -r 75 --rotate normal
    xrandr --output eDP-1-1 --off;;
  *)echo "------Invalid Selection";;
esac

