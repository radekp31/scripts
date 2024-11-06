#!/run/current-system/sw/bin/bash



# Directory containing the files (change as needed)
TARGET_DIR="."

# Loop through all files in the directory
for file in "$TARGET_DIR"/*; do
    # Check if the item is a file
    if [ -f "$file" ]; then
        # Extract the directory path and original filename
        dir_path=$(dirname "$file")
        original_filename=$(basename "$file")
        extension="${original_filename##*.}"
        base_name="${original_filename%.*}"

        # Create a standardized filename:
        # 1. Replace spaces and special characters with underscores
        # 2. Convert to lowercase
        new_filename=$(echo "$base_name" | \
            sed 's/[^a-zA-Z0-9]/_/g' | \
            tr '[:upper:]' '[:lower:]')

        # Append the file extension
        new_filename="${new_filename}.${extension}"

        # Rename the file if the new name is different
        if [ "$original_filename" != "$new_filename" ]; then
            mv "$file" "$dir_path/$new_filename"
            echo "Renamed '$original_filename' to '$new_filename'"
        fi
    fi
done

