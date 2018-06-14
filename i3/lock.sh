#!/bin/bash - 
#===============================================================================
#
#          FILE: lock.sh
# 
#         USAGE: ./lock.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/22/2018 06:58
#      REVISION:  ---
#===============================================================================

IMAGE=/tmp/i3lock.png

# lock assuming the image exists (created by crontab)
i3lock -i $IMAGE
sleep 30; pgrep i3lock && xset dpms force off
