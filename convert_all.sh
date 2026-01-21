#!/bin/bash

# Generate blog index from template
generate_blog_index() {
    local posts=""

    # Collect all blog posts with their dates
    for file in blog/*.md; do
        if [[ -f "$file" ]]; then
            # Extract title and date from YAML frontmatter
            title=$(grep -m1 "^title:" "$file" | sed 's/title: *//')
            date=$(grep -m1 "^date:" "$file" | sed 's/date: *//')

            # Get filename for the link
            base=$(basename "$file" .md)

            # Add to posts list
            posts="${posts}- **[$title](blog/${base}.html)** — $date\n"
        fi
    done

    # Sort posts by filename (date prefix) in reverse order
    sorted_posts=$(echo -e "$posts" | sort -t'/' -k2 -r)

    # Generate blog_index.md from template
    if [[ -f "blog_index_template.md" ]]; then
        sed "s|{{POSTS}}|$sorted_posts|" blog_index_template.md > blog_index.md
    fi
}

# Generate blog index first
generate_blog_index

# Loop through all .md files in the current directory except "readme.md" and template
for file in *.md; do
    if [[ "$file" != "readme.md" && "$file" != "blog_index_template.md" ]]; then
        # Extract the filename without the extension
        base_name="${file%.md}"

        # Run the pandoc command with the modified filenames
        pandoc --toc -s --css reset.css --css index.css -i "$file" -o "$base_name.html" --template=template.html
    fi
done

# Loop through all .md files in the blog directory
for file in blog/*.md; do
    if [[ -f "$file" ]]; then
        # Extract the filename without the extension
        base_name="${file%.md}"

        # Run the pandoc command with blog template and relative CSS paths
        pandoc -s --css ../reset.css --css ../index.css -i "$file" -o "$base_name.html" --template=blog-template.html
    fi
done