#!/bin/sh
# extbin: xrdb, sxhkd, dunst, xsetroot, unclutter, xscreensaver, start-pulseaudio-x11, bspwm

# --- Xresources ---
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# --- Shortcuts ---
sxhkd &

# --- Notifications ---
dunst &

# --- Misc ---
xsetroot -solid grey20 -cursor_name left_ptr &
unclutter -root &

# --- Screensaver ---
#xscreensaver &

# --- Sound ---
start-pulseaudio-x11 &

# --- Window Manager ---
exec bspwm

# vim: set ft=sh:
