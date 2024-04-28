#!/bin/bash

git add .
git commit -m "Update Configs $(date)" -m "Date: $(date)" -s
git push -f
