#!/bin/bash
./changelog.sh > README.md
git add .
git commit -m "update : $(date)"
git push origin main
git push --tags
