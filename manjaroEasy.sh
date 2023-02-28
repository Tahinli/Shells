clear

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
function installation
	{
		echo -e '\n-->Flatpak\n'
		yes | sudo pacman -S flatpak
		echo -e '\n-->Wget\n'
		yes | sudo pacman -S wget
		echo -e '\n-->Steam\n'
		yes | sudo pacman -S steam
		echo -e '\n-->MangoHUD\n'
		yes | sudo pacman -S mangohud
		echo -e '\n-->Gamemode\n'
		yes | sudo pacman -S gamemode
		echo -e '\n-->Git\n'
		yes | sudo pacman -S git
		echo -e '\n-->Alacritty\n'
		yes | sudo pacman -S alacritty
		echo -e '\n-->Tilda\n'
		yes | sudo pacman -S tilda
		echo -e '\n-->Discord\n'
		yes | sudo pacman -S discord
		echo -e '\n-->Code\n'
		yes | sudo pacman -S code
		echo -e '\n-->PKG Config\n'
		yes | sudo pacman -S pkgconfig
		echo -e '\n-->Remmina\n'
		yes | sudo pacman -S remmina
		echo -e '\n-->Audacity\n'
		yes | sudo pacman -S audacity
		echo -e '\n-->Kdenlive\n'
		yes | sudo pacman -S kdenlive
		echo -e '\n-->YT-DLP\n'
		yes | sudo pacman -S yt-dlp
		echo -e '\n--->Github Desktop over Flatpak\n'
		flatpak install -y io.github.shiftey.Desktop
		echo -e '\n-->Spotify over Flatpak\n'
        	flatpak install -y flathub com.spotify.Client
		echo -e '\n-->Motrix over Flatpak\n'
		flatpak install -y motrix
		echo -e '\n-->GPU Screen Recorder over Flatpak\n'
		flatpak install -y flathub com.dec05eba.gpu_screen_recorder
		echo -e '\n-->WPS Office over Flatpak\n'
		flatpak install -y flathub com.wps.Office
		echo -e '\n-->Any Desk over Flatpak\n'
		flatpak install -y flathub com.anydesk.Anydesk
		echo -e '\n-->Green with Envy over Flatpak\n'
    	flatpak install -y com.leinardi.gwe
		echo -e '\n»»»Wget Sequence\n'
		hifile
		webappmanager
		goverlay
		debtap
	}

function debtap
	{
		mkdir ~/debtap
		git clone https://github.com/helixarch/debtap.git ~/debtap/
		(cd ~/debtap/ ; sudo ./debtap -u)
	}

	function webappmanager
	{
		echo -e '\n-->WebAppManager\n'
		#Web App Requeriments
		yes | sudo pacman -S python
		yes | sudo pacman -S python-setproctitle
		yes | sudo pacman -S python-pip
		pip install tldextract
		pip install pillow
		yes | sudo pacman -S gtk3
		mkdir ~/tTemp
		git clone https://github.com/linuxmint/webapp-manager.git ~/tTemp/
		$(cd ~/tTemp/ ; ./test)
		sudo rm -r ~/tTemp
	}

function goverlay
	{
		echo -e '\n-->GOverlay\n'
		#Goverlay Requeriments
		yes | sudo pacman -S qt5-base
		yes | sudo pacman -S qt5pas
		mkdir ~/GOverlay
		wget -O GOVERLAY_T.tar.xz https://github.com/benjamimgois/goverlay/releases/download/0.9/goverlay_0_9.tar.xz
		tar xf GOVERLAY_T.tar.xz -C  ~/GOverlay
		rm -r GOVERLAY_T.tar.xz
		sudo chmod +x ~/GOverlay/start_goverlay.sh
	}
function hifile
	{
		echo -e '\n-->HiFile\n'
		wget -O HiFile.AppImage https://www.hifile.app/api/v1/download?system=linux-appimage
		chmod +x HiFile.AppImage
		mkdir ~/.local/share/applications
		yes | sudo mv HiFile.AppImage ~/.local/share/applications/
		echo -e "\n/home/$USER/.local/share/applications/HiFile.AppImage" | sudo tee /bin/hifile
		sudo chmod +x /bin/hifile
	}

echo -e '	--->Tahinli Manjaro Easy Setup<---'
echo -e '\n\n	1) Check Updates\n	2) Install Programs'
read selection
case $selection in
1)
	echo -e '	-|Checking Updates\n'
	sudo pacman -Syyu
	;;
2)
	echo -e '	-|Installation Selected\n'
	installation
	;;
3) webappmanager;;
4) hifile;;
*)
	echo -e '	**\Invalid Selection\**\n	Quiting'
	;;
esac
echo -e '\n	DONE\'
restartSelection
