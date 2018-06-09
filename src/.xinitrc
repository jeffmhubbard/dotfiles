#!/bin/sh

##  File: .xinitrc
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 2, 2018

# --- Enviroment ---
export MPD_HOST=python
export MPD_PORT=6600
export RTV_BROWSER=qutebrowser
export QT_QPA_PLATFORMTHEME=gtk2

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
