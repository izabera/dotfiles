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
xset +fp /usr/share/fonts/local
xset fp rehash
sxhkd -c "$HOME"/.config/bspwm/sxhkdrc &
xsetroot -cursor_name left_ptr
feh --bg-fill ~/.config/backgrounds/autumn.png
exec bspwm
#exec rio
