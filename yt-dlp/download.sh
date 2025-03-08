#Download and keep names
youtube-dl -i -f mp4 --yes-playlist -o '/your/desired/path/%(title)s.%(ext)s' '<URL>'

#Adjust quality
sudo yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 --audio-format mp3 --audio-quality 0  -o "/foo/bar/path/%(title)s.%(ext)s" "<URL>"
