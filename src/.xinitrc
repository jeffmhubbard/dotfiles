#!/usr/bin/env bash
# extbin: xrdb, xsetroot, feh, compton, unclutter, dunst, xautolock,
#       betterlockscreen, start-pulseaudio-x11, urxvtd, i3

# Environment variables
export BROWSER=/usr/bin/qutebrowser
export RTV_BROWSER=$BROWSER
export TERMINAL=urxvtc
export MPD_HOST=pythos
export MPD_PORT=6600
export QT_QPA_PLATFORMTHEME=gtk2

export I3SCRIPTS=$HOME/.config/i3/scripts
export PBSCRIPTS=$HOME/.config/polybar/scripts

# Load X settings
xrdb -merge ~/.Xresources

# Restore wallpaper
# sh ~/.fehbg &
sh "$HOME/.bin/feh_randomizer.sh" "$HOME/Wallpapers/antsy" 600 &

# Extra X settings
xsetroot -cursor_name left_ptr &

# Lock screen
xset s 600 180 &
xss-lock -l -- awful --capture &

# Hide idle mouse cursor
unclutter -root &

# X compositor
compton &

# Start notification daemon
dunst &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Sound daemon
start-pulseaudio-x11 &

# Terminal emulator
urxvtd -q -o -f &

# Storage
udiskie &

# Start window manager
exec i3

# vim: set ft=sh:
