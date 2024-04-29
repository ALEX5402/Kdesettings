#!/bin/bash

localdir="$HOME/.local"
configdir="$HOME/.config"
fontsdir="$HOME/.fonts"
themedir="$HOME/.themes"
icondir="$HOME/.icons"

create_dir_if_not_exist() {
    local dir="$1"

    # Check if the directory exists
    if [ ! -d "$dir" ]; then
        # If the directory doesn't exist, create it
        mkdir -p "$dir"
        echo "Directory '$dir' created."
    else
        echo "Directory '$dir' already exists. Making Links"
    fi
}

# making the dirs
create_dir_if_not_exist "$localdir"
create_dir_if_not_exist "$configdir"
create_dir_if_not_exist "$fontsdir"
create_dir_if_not_exist "$icondir"
create_dir_if_not_exist "$themedir"

cp -r -l -f "$PWD/Local/"* "$localdir" && echo "Local files successfully linked to repo"
cp -r -l -f "$PWD/Config/"* "$configdir" && echo "Config files successfully linked to repo"
cp -r -l -f "$PWD/Fonts/"* "$fontsdir" && echo "Fonts files successfully linked to repo"
cp -r -l -f "$PWD/Themes/"* "$themedir" && echo "Theme files successfully linked to repo"
cp -r -l -f "$PWD/Icons/"* "$icondir" && echo "Icons files successfully linked to repo"

prompt_yes_no() {
    while true; do
        read -p "$1 (yes/no): " yn
        case $yn in
            [Yy]* ) return 0;;  # Yes, return 0
            [Nn]* ) return 1;;  # No, return 1
            * ) echo "Please answer yes or no.";;
        esac
    done
}

clone_git_repo() {
    git clone https://github.com/ALEX5402/wallpapers
    echo "wallpapers downloaded"
}

if prompt_yes_no "Do you want to the my wallpaers ?"; then
   clone_git_repo
fi


if prompt_yes_no "Do you want to apply grub theme ?"; then
   sudo bash Grub-theme/install.sh
fi
