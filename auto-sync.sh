#!/bin/bash

#set the backup date
date > time.txt
bash changelog.sh > changes.md
git add .
git commit -m "Update Configs : $(date)" -m "Time : $(date +%T)" -s
git push -f


