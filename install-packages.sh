#!/bin/bash

# Check if a package is installed
is_installed() {
    pacman -Qi "$1" &> /dev/null
    return $?
}

# Function to install packages using paru
install_packages() {
    local file="$1"

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines and lines starting with #
        [[ -z "$line" || $line == \#* ]] && continue
        
        # Extract the package name by removing comments
        package=$(echo "$line" | cut -d '#' -f 1 | xargs)
        
        # If package is non-empty, check if it's installed
        if [[ -n "$package" ]]; then
            if is_installed "$package"; then
                echo "$package is already installed. Skipping..."
            else
                echo "Installing $package..."
                paru -S --noconfirm "$package"
            fi
        fi
    done < "$file"
}

# Check if the script received a file argument
if [[ -z "$1" ]]; then
    echo "Usage: $0 <path-to-txt-file>"
    exit 1
fi

# Run the install_packages function with the provided file
install_packages "$1"

echo "All packages processed."

