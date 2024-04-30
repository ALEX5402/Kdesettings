#!/bin/bash

#set the backup date
date > time.txt

# Get the list of modified files
modified_files=$(git diff --name-only)

# Get the count of modified files
file_count=$(echo "$modified_files" | wc -l)

# Check if there are modified files
if [[ -z "$modified_files" ]]; then
    echo "No changes to commit."
    exit 0
fi

# Generate the commit message header
commit_message=""

if [[ $file_count -eq 1 ]]; then
    commit_message+="Updated: "
else
    commit_message+="Updated $file_count files: "
fi

# Append the list of modified files to the commit message
commit_message+="$modified_files"

# Append the diffs for each modified file
while IFS= read -r file; do
    commit_message+="\n\nChanges in $file:\n"
    commit_message+="$(git diff --color=always "$file" | sed 's/^/    /')"
done <<< "$modified_files"

echo "$commit_message and $modified_files " > changes.md

git add .
git commit -m "Update Configs : $(date) Time : $(date +%T)"
git push
