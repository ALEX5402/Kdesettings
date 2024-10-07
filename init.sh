#!/bin/bash

pacman -Qs > packages-with-info.txt
pacman -Qqe > current-packages-dump.txt

