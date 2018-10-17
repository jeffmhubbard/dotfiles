#!/usr/bin/env bash
# extbin: xrdb, sxhkd, dunst, xsetroot, unclutter, start-pulseaudio-x11, bspwm

# Load X settings
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start keybind daemon
sxhkd &

# Start notification daemon
dunst &

# Set mouse pointer
xsetroot -cursor_name left_ptr &

# Hide mouse cursor when not in use
unclutter -root &

# Set random background color
[[ -f ~/.bin/xsetrbg ]] && sh ~/.bin/xsetrbg &

# Restore wallpaper
[[ -f ~/.fehbg ]] && sh ~/.fehbg &

# Screenlocker
xautolock -resetsaver \
    -time 10 \
    -notify 30 \
    -notifier "notify-send -u low -t 10000 Attention 'The screen will lock in 30 seconds.'" \
    -locker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
    -nowlocker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
    &

# Sound daemon
start-pulseaudio-x11 &

# Start window manager
exec bspwm

# vim: set ft=sh:
