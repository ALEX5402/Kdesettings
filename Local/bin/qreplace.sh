#!/bin/bash

# Function to add text to filenames
add_text() {
    local dir=$1
    local text=$2
    local position=$3

    cd "$dir" || exit 1

    for entry in *; do
        if [ -d "$entry" ]; then
            mv "$entry" "$text$entry"
        elif [ -f "$entry" ]; then
            if [ "$position" == "beginning" ]; then
                mv "$entry" "$text$entry"
            elif [ "$position" == "end" ]; then
                extension="${entry##*.}"
                filename="${entry%.*}"
                mv "$entry" "$filename$text.$extension"
            fi
        fi
    done

    cd - > /dev/null || exit 1
}

# Function to replace text in filenames
replace_text() {
    local dir=$1
    local old_text=$2
    local new_text=$3

    cd "$dir" || exit 1

    for entry in *; do
        if [ -d "$entry" ]; then
            new_name=$(echo "$entry" | sed "s/$old_text/$new_text/gI")
            mv "$entry" "$new_name"
        elif [ -f "$entry" ]; then
            new_name=$(echo "$entry" | sed "s/$old_text/$new_text/gI")
            mv "$entry" "$new_name"
        fi
    done

    cd - > /dev/null || exit 1
}

# Main script
echo "Bulk renaming script"

# Choose directory through file-picker
directory=$(zenity --file-selection --directory --title="Select Directory")
if [ $? -ne 0 ]; then
    echo "No directory selected. Exiting..."
    exit 1
fi

# Change to the selected directory
cd "$directory" || exit 1

echo "1. Add text to filenames"
echo "2. Replace text in filenames"
read -rp "Choose an option (1/2): " option

case $option in
    1)
        read -rp "Enter the text to add: " text
        read -rp "Should it be appended to the beginning or end? (beginning/end): " position
        echo "Adding \"$text\" to filenames and folder names..."
        add_text "$(pwd)" "$text" "$position"
        ;;
    2)
        read -rp "Enter the text to replace: " old_text
        read -rp "Enter the new text: " new_text
        echo "Replacing \"$old_text\" with \"$new_text\" in filenames and folder names..."
        replace_text "$(pwd)" "$old_text" "$new_text"
        ;;
    *)
        echo "Invalid option, exiting..."
        exit 1
        ;;
esac

echo "Done"
