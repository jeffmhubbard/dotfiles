#!/usr/bin/env bash

# extbin: xrdb, xset, xsetroot, feh, picom, unclutter,
#         dunst, xss-lock, xob, start-pulseaudio-x11,
#         termite, i3, udiskie, polkit-gnome, blueman

# Environment variables
export TERMINAL=termite
export BROWSER=qutebrowser
export QT_QPA_PLATFORMTHEME=qt5ct

# mpd
export MPD_HOST=localhost
export MPD_PORT=6600
export MPD_PLAYLISTS=$HOME/.cache/mpd/playlists

# toggle-touchpad.sh
export TOUCHPAD=10

# script paths
export I3SCRIPTS=$HOME/.config/i3/scripts
export PBSCRIPTS=$HOME/.config/polybar/scripts

# Load X settings
xrdb -merge "$HOME/.Xresources"

# Extra X settings
xsetroot -cursor_name left_ptr &

# Lock screen
xset s 600 180 &
xss-lock -l -- multilockscreen --lock &

# Hide idle mouse cursor
unclutter -root &

# Start notification daemon
dunst &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Sound daemon
start-pulseaudio-x11 &

# Volume and brightness bars
sh -c "$HOME/.config/xob/load-bars.sh" &

# Storage
udiskie &

# Bluetooth
blueman-applet &

# X compositor
picom &

# Start window manager
WM_DIR="$HOME/.config/i3"
WM_CONF="$WM_DIR/$HOSTNAME.conf"
[[ -f "$WM_CONF" ]] || WM_CONF="$WM_DIR/default.conf"

exec i3 -c "$WM_CONF"

# vim: set ft=sh ts=2 sw=0 et:
