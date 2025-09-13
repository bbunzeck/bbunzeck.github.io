#!/bin/bash

# Loop through all .md files in the current directory except "readme.md"
for file in *.md; do
    if [[ "$file" != "readme.md" ]]; then
        # Extract the filename without the extension
        base_name="${file%.md}"

        # Run the pandoc command with the modified filenames
        pandoc --toc -s --css reset.css --css index.css -i "$file" -o "$base_name.html" --template=template.html
    fi
done