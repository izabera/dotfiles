#!/bin/sh
setxkbmap it -option compose:menu
xrdb -merge ~/.Xresources
urxvtd -q -f -o
clipit &
#cbatticon &
#volumeicon &
#exec awesome

#exec i3

#bar &
sxhkd -c "$HOME"/.config/bspwm/sxhkdrc &
xsetroot -cursor_name left_ptr
feh --bg-scale ~/.config/backgrounds/woman-face.png
exec bspwm
#exec rio
