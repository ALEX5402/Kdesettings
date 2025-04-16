#!/bin/bash

# Check if the JSON file and search directory are provided as arguments
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 <json-file> <search-directory>"
    exit 1
fi

# Check if the provided JSON file exists
if [[ ! -f "$1" ]]; then
    echo "JSON file '$1' not found."
    exit 1
fi

# Check if the provided search directory exists
if [[ ! -d "$2" ]]; then
    echo "Search directory '$2' not found."
    exit 1
fi

json_file="$1"
search_dir="$2"
output_file="commands.json"

# Read the JSON file content
json_data=$(cat "$json_file")

# Extract all object (.o) files from the "command" field of the JSON using regex
object_files=$(echo "$json_data" | grep -oP '(?<=-o\s)[^ ]+\.o')

# Loop through each .o file
for obj in $object_files; do
    # Extract the .o file name without any directory path
    obj_file_name=$(basename "$obj")

    # Search for the full path of the .o file in the specified directory and its subdirectories
    full_path=$(find "$search_dir" -name "$obj_file_name" -type f 2>/dev/null)

    # If the full path is found, replace the .o file path in both the "command" and "file" fields
    if [[ -n "$full_path" ]]; then
        # Escape special characters in full_path for sed replacement
        full_path_escaped=$(echo "$full_path" | sed 's/[\/&]/\\&/g')
        obj_escaped=$(echo "$obj" | sed 's/[\/&]/\\&/g')

        # Replace the path of the .o file in the "command" field
        json_data=$(echo "$json_data" | sed "s|$obj_escaped|$full_path_escaped|g")
    else
        echo "Warning: $obj not found in $search_dir or its subdirectories"
    fi
done

# Write the updated JSON to the output file
echo "$json_data" > "$output_file"

echo "Updated $output_file generated successfully."
