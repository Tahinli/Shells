function wayland
    {
        echo -e 'Switching to Wayland\n'
        sudo sed -i '/autologin-session=plasma/ c\autologin-session=plasmawayland' /etc/lightdm/lightdm.conf
    }
function x11
    {
        echo -e 'Switching to X11'
        sudo sed -i '/autologin-session=plasma/ c\autologin-session=plasma' /etc/lightdm/lightdm.conf
    }
echo -e 'Change Display Server\n'
read selection <<< $XDG_SESSION_TYPE
echo -e '\t1) Automatic\n\t2) X11\n\t3) Wayland'
read ch
case $ch in
    1)
        read selection <<< $XDG_SESSION_TYPE
        echo -e "Current Session = $selection"
        case $selection in
            "x11")
                wayland
            ;;
            "wayland")
                x11
            ;;
        esac
    ;;
    2)
        x11
    ;;
    3)
        wayland
    ;;
esac


