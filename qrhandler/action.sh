#!/bin/bash

APP=${APP:-UNKNOWN_APP}
TIME=`date +"%s_%N"`
QR="$@"
MD5=`echo -E "$QR" | md5sum -t - | sed 's@ .*$@@g'`


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

S="/tmp/SCROT.${APP}.${TIME}.${MD5}.png"

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

echo -E "'${QR}' => '${S}'" 1>&2

xmessage -buttons "OK:0" -center -timeout 4 "Taking Screenshot in 5 sec..." > /dev/null 2>&1 &
scrot -u -m -cd 5 "${S}" 

# https://wiki.archlinux.org/index.php/taking_a_screenshot 

# http://askubuntu.com/questions/226829/how-to-take-screenshot-of-an-x11-based-gui-from-a-text-terminal-such-as-tty1

#!? xwd -root -out screenshot.xwd, xwd -root -display :0 | convert - jpg:- | jp2a - --colors
# reuires x11-apps for xwd, imagemagick for convert and jp2a.)

# with imagemagick:
# shutter -f -e -n -o "$HOME/Pictures/screenshot.png" # screenshot
# import -window root ~/Pictures/$(date '+%Y%m%d-%H%M%S').png