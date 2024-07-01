echo -e 'Give a link'
read selection
echo -e 'What do you want from video\n\t1) Best MP4\n\t2) Best MP3\n\t3) Both'
read menu

case $menu in
1)
	yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best $selection
	;;

2)
	yt-dlp -f 'ba' -x --audio-format mp3 $selection
	;;
3)
	yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best $selection
        yt-dlp -f 'ba' -x --audio-format mp3 $selection
        ;;
esac
