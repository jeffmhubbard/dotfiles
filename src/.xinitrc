#!/bin/sh

# --- ---
export MPD_HOST=python
export MPD_PORT=6600

export RTV_BROWSER=qutebrowser

# --- Xresources ---
userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

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

# --- extensions ---

# --- window manager ---
exec bspwm

# vim: set filetype=sh :
