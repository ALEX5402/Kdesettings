#!/bin/bash

# Define your targeted folder
target_folder="/home/alex/Documents/GitHub/blackboxtest/app/src/main/java/com/vspace/"

# Find all Java files in the targeted folder and its subfolders
find "$target_folder" -type f -name "*.java" | while read -r file; do
    # Use sed to replace the string
    sed -i 's/import top.niunaijun.bcore/import com.vcore/g' "$file"
    echo "Replaced in $file"
done

echo "Replacement complete."
