#!/bin/bash

cd ~/dotfiles-main
pacman -Qs > packages-with-info.txt
pacman -Qqe > current-packages-dump.txt
./push.sh
