#!/bin/bash

date > time.txt
git add .
git commit -m "Update Configs $(date)" -m "Date: $(date)" -s
git push -f
