#!/bin/bash

echo "# My Hyprland Dotfiles"
echo "  Don't Touch My dot files 🙂"
echo " "
cat info.txt
echo " "
echo "## Changelog $(date)"
echo '```'
git diff --stat
echo '```'
echo " "

