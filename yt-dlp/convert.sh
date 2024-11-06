#!/run/current-system/sw/bin/bash



# Directory to search for .mp4 files (change as needed)
SEARCH_DIR="."

# Loop through all .mp4 files in the directory and subdirectories
find "$SEARCH_DIR" -type f -name "*.mp4" -print0 | while IFS= read -r -d '' mp4_file; do
    # Get the base filename without the extension
    base_name="${mp4_file%.mp4}"
    
    # Define the corresponding .mpeg filename
    mpeg_file="${base_name}.mpeg"

    # Check if the .mpeg file already exists
    if [ ! -f "$mpeg_file" ]; then
        echo "Converting '$mp4_file' to '$mpeg_file' with MPEG2 video and MP3 audio..."
        #ffmpeg -nostdin -i "$mp4_file" -c:v mpeg1video -q:v 5 -c:a mp2 -b:a 128k "$mpeg_file"
	#ffmpeg -nostdin -i "$mp4_file" -r 25 -c:v mpeg1video -q:v 5 -c:a mp2 -b:a 128k "$mpeg_file"
        ffmpeg -nostdin -i "$mp4_file" -vf "scale=800:480" -r 25 -c:v mpeg1video -b:v 1500k -c:a mp2 -b:a 224k -ar 44100 "$mpeg_file"
        echo "Conversion complete: '$mpeg_file'"
    else
        echo "MPEG file already exists for '$mp4_file', skipping."
    fi

done

