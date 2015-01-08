#!/bin/sh
# shebang to enable nerd commenter
setxkbmap it
xrdb -merge /home/izabera/.Xresources
urxvtd -q -f -o
cbatticon &
volumeicon &
clipit &
exec awesome

#exec i3

#sxhkd &
#exec bspwm
