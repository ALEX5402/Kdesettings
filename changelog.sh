#!/bin/bash

echo "# Kdesettings"
echo "  My kde settings on kde 6 with all config files"
echo " "
cat info.txt
echo " "
echo "## Changelog $(date)"
echo '```'
git diff --stat
echo '```'
echo " "
