echo -e "\n<--##Tahinli Resolution Script##-->\n"
echo "   1- Join- Second_Vertical"
echo "   2- Join- Linear_Extended"
echo "   3- Mirror"
echo "   4- First Monitor Only"
echo "   5- Second Monitor Only"
read selection
if [[ $selection > 0 ]] && [[ $selection < 6 ]];
then
  echo "   --->Request's Accepted-|"
  xrandr --output HDMI-0 --off
  xrandr --output eDP-1-1 --off
fi
case $selection in
  1)xrandr --output HDMI-0 --mode 1920x1080 --right-of eDP-1-1  -r 75 --rotate right
    xrandr --output eDP-1-1 --mode 1920x1080 --left-of HDMI-0 -r 144 --rotate normal;;
  2)xrandr --output HDMI-0 --mode 1920x1080 --right-of eDP-1-1 -r 75 --rotate normal
    xrandr --output eDP-1-1 --mode 1920x1080 --left-of HDMI-0 -r 144 --rotate normal;;	  
  3)xrandr --output eDP-1-1 --mode 1920x1080 -r 144 --rotate normal
    xrandr --output HDMI-0 --mode 1920x1080 -r 75 --rotate normal;;
  4)xrandr --output eDP-1-1 --mode 1920x1080 -r 144 --rotate normal;;
  5)xrandr --output HDMI-0 --mode 1920x1080 -r 75 --rotate normal;;
  *)echo "------Invalid Selection";;
esac
echo -e "\n   # DONE #"

