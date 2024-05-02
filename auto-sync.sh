#!/bin/bash

#set the backup date
date > time.txt
date && git diff . > changes.txt
git add .
git commit -m "Update Configs : $(date)" -m "Time : $(date +%T)" -s
git push -f
