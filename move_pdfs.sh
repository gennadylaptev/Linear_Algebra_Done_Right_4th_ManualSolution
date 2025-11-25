#!/bin/bash

# Check if source directory exists
if [ ! -d "./Tex" ]; then
    echo "Error: Directory './Tex' does not exist!"
    exit 1
fi

# Create target directory if it doesn't exist
mkdir -p "./solution_pdf"

# Count and list PDF files before moving
pdf_files=(./Tex/*.pdf)
count=${#pdf_files[@]}

if [ $count -eq 0 ]; then
    echo "No PDF files found in ./Tex directory"
    exit 0
fi

echo "Moving PDF files:"
for file in "${pdf_files[@]}"; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "  - $filename"
    fi
done

# Move all PDF files
mv ./Tex/*.pdf ./solution_pdf/

echo "Successfully moved $count PDF files from ./Tex to ./solution_pdf"
