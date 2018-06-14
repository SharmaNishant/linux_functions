#!/bin/bash - 
#===============================================================================
#
#          FILE: generate_blur_lock_image.sh
# 
#         USAGE: ./generate_blur_lock_image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/22/2018 07:02
#      REVISION:  ---
#===============================================================================

#!/bin/bash

DISPLAY=:0 /usr/bin/scrot /tmp/i3lock_new.png
/usr/bin/mogrify -resize 50% -blur 0x2 -spread 4 -resize 200% /tmp/i3lock_new.png
#/usr/bin/mogrify -blur 4x3 -spread 5 /tmp/i3lock_new.png
mv /tmp/i3lock_new.png /tmp/i3lock.png

