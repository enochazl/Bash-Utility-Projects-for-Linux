#!/bin/bash

# Input and output directories
INPUT_DIR="input_images"
OUTPUT_DIR="output_images"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Convert all PNG files in the input directory to JPG
for img in "$INPUT_DIR"/*.png; do
    if [ -f "$img" ]; then
        filename=$(basename "$img" .png)
        output_path="$OUTPUT_DIR/$filename.jpg"
        
        # Convert PNG to JPG
        convert "$img" -quality 95 "$output_path"
        
        echo "Converted: $img -> $output_path"
    fi
done

echo "Conversion complete!"

