#!/bin/sh

# --- Xresources ---
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# --- Sound ---
start-pulseaudio-x11 &

# --- Shortcuts ---
sxhkd &

# --- Mouse ---
xsetroot -cursor_name left_ptr &
unclutter -root &

# --- Notifications ---
dunst &

# --- Wallpaper ---
xsetroot -solid grey20
[[ -f ~/.fehbg ]] && sh ~/.fehbg &

# --- Screensaver ---
xautolock &

# --- Window Manager ---
exec bspwm


# vim: set ft=sh :
