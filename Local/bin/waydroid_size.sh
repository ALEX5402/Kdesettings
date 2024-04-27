#!/bin/bash

waydroid prop set persist.waydroid.height $1
waydroid prop set persist.waydroid.width $2


echo "set hight : $1 width : $2"
