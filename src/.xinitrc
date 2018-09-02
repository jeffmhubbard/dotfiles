#!/bin/sh
# extbin: xrdb, sxhkd, dunst, xsetroot, unclutter, xscreensaver, start-pulseaudio-x11, bspwm

# --- Xresources ---
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# --- Shortcuts ---
sxhkd &

# --- Notifications ---
dunst &

# --- Wallpaper ---
[[ -f ~/.fehbg ]] && sh ~/.fehbg

# --- Misc ---
xsetroot -solid grey20 -cursor_name left_ptr &
unclutter -root &

# --- Screensaver ---
xautolock -resetsaver \
    -time 10 \
    -notify 30 \
    -notifier "notify-send -u low -t 10000 Attention 'The screen will lock in 30 seconds.'" \
    -locker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
    -nowlocker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
    &

# --- Sound ---
start-pulseaudio-x11 &

# --- Window Manager ---
exec bspwm

# vim: set ft=sh:
