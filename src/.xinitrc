#!/bin/sh

# --- Xresources ---
xrdb -merge ~/.Xresources

# --- sound ---
start-pulseaudio-x11 &

# --- mouse ---
xsetroot -cursor_name left_ptr &
unclutter -root &

# --- compositor ---
compton &

# --- notifications ---
dunst &

# --- wallpaper ---
sh ~/.fehbg &

# --- terminal ---
urxvtd -q -o -f &

# --- window manager ---
exec bspwm
