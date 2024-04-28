#!/bin/bash

git add .
git commit -m "Update Configs" -m "Date: $(date)" -s
git push -f
