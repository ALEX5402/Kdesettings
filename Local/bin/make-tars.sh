#!/bin/bash

# Check if the target directory is provided and exists
if [ -z "$1" ] || [ ! -d "$1" ]; then
  echo "Error: No directory specified or the specified path is not a directory."
  echo "Usage: $0 <target-directory>"
  exit 1
fi

TARGET_DIR=$1

# Loop through each item in the target directory
for folder in "$TARGET_DIR"/*; do
  # Check if it is a directory
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")
    tar -czf "$folder_name.tar.gz" -C "$TARGET_DIR" "$folder_name"
    echo "Compressed $folder_name into $folder_name.tar.gz"
  fi
done
