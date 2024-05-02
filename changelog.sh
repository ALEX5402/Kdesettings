#!/bin/bash

#set the backup date
echo "## $(date)"
echo '``'
echo "$(git diff .)"
echo '``'
