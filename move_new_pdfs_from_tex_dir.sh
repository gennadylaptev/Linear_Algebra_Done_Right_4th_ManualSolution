#!/bin/bash

# Define directories
TEX_DIR="Tex"
SOLUTION_DIR="solution_pdf"

# Analyze the output of `git status`
UNTRACKED_PDFS=$(git status --porcelain | awk -v tex_dir="$TEX_DIR" '
$1 ~ /^\?\?/ && $2 ~ /\.pdf$/ && index($2, tex_dir) == 1 { print $2 }
')

echo "$UNTRACKED_PDFS"

# Check if any untracked PDF files are found
if [[ -z "$UNTRACKED_PDFS" ]]; then
    echo "No untracked PDF files found in $TEX_DIR."
else
    echo "Untracked PDF files in $TEX_DIR:"
    echo "$UNTRACKED_PDFS"
    
    # Move untracked PDF files to the solution directory
    while IFS= read -r file; do
        mv "$file" "$SOLUTION_DIR"
        echo "Moved $file to $SOLUTION_DIR"
    done <<< "$UNTRACKED_PDFS"
fi

