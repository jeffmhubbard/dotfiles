#!/usr/bin/env bash

# extbin: xrdb, xset, xsetroot, feh, compton, unclutter,
#         dunst, xss-lock, awful, start-pulseaudio-x11,
#         urxvtd, i3, udiskie, polkit-gnome

# Environment variables
export BROWSER=qutebrowser
export RTV_BROWSER=$BROWSER
export TERMINAL=urxvtc
export QT_QPA_PLATFORMTHEME=gtk2

# mpd
export MPD_HOST=localhost
export MPD_PORT=6600

# toggle-touchpad.sh
export TOUCHPAD='12'

#
export I3SCRIPTS=$HOME/.config/i3/scripts
export PBSCRIPTS=$HOME/.config/polybar/scripts

# Load X settings
xrdb -merge $HOME/.Xresources

# Extra X settings
xsetroot -cursor_name left_ptr &

# Lock screen
xset s 600 180 &
xss-lock -l -- awful --lock &

# Hide idle mouse cursor
unclutter -root &

# Start notification daemon
dunst &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Sound daemon
start-pulseaudio-x11 &

# xob
$HOME/.config/xob/load-bars.sh &

# Storage
udiskie &

# X compositor
picom &

# Terminal emulator
urxvtd -q -o -f &

# Start window manager
exec i3

# vim: set ft=sh:
