#!/bin/bash

cd ~/dotfiles
pacman -Qs > packages-with-info.txt
pacman -Qqe > current-packages-dump.txt
./push.sh
