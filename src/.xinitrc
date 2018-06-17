#!/bin/sh

##  File: .xinitrc
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 17, 2018

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

# --- Window Manager ---
exec bspwm

# vim: set ft=sh :
