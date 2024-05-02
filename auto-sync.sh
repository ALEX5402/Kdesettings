#!/bin/bash
# bash changelog.sh > changes.md
#set the backup date
date > time.txt
git add .
git commit -m "Update Configs : $(date)" -m "Time : $(date +%T)" -s
git push


