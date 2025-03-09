#List all available qualities for a link
yt-dlp -F "<URL>"

#Download and keep names
youtube-dl -i --yes-playlist -o '/your/desired/path/%(title)s.%(ext)s' "<URL>"

#Select 720p
yt-dlp -f "bv*[height=720]+ba" -o "/foo/bar/path/%(title)s.%(ext)s" "<URL>"

#Adjust ouput format
sudo yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 --audio-format mp3 --audio-quality 0  -o "/foo/bar/path/%(title)s.%(ext)s" "<URL>"
