#!/bin/bash

# Set the source directory (change this as needed)
SOURCE_DIR="malnutrition"

# Counter variable for sequential numbering
count=1

# Loop through all JPG files in the directory (sorted by name)
for file in "$SOURCE_DIR"/*.jpg; do
    if [ -f "$file" ]; then
        # Construct new filename
        new_name="$SOURCE_DIR/train_malnutrition.$count.jpg"

        # Rename file
        mv "$file" "$new_name"

        echo "Renamed: $file -> $new_name"

        # Increment counter
        ((count++))
    fi
done

echo "Renaming complete!"
