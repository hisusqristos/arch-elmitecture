#!/bin/bash

# List all HTML files in the 'dest' directory and save to a JavaScript file
echo "const filesList = [" > files.js
for file in dest/*.html; do
    filename=$(basename "$file")
    echo "\"$filename\"," >> files.js
done
echo "];" >> files.js