#!/bin/sh
setxkbmap it -option compose:menu
xrdb -merge ~/.Xresources
urxvtd -q -f -o
cbatticon &
volumeicon &
clipit &
#exec awesome

#exec i3

#bar &
sxhkd -c "$HOME"/.config/bspwm/sxhkdrc &
xsetroot -bg "#181818" -bitmap "/usr/include/X11/bitmaps/xsnow" -cursor_name left_ptr
exec bspwm
