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
[[ -f ~/.Xresources ]] && \
    xrdb -merge -I$HOME ~/.Xresources

# Extra X settings
[[ "command -v xsetroot" ]] && \
    xsetroot -cursor_name left_ptr &

# Hide idle mouse cursor
[[ "command -v unclutter" ]] && \
    unclutter -root &

# X compositor
[[ "command -v compton" ]] && \
    compton &

# Restore wallpaper
[[ -f ~/.fehbg ]] && \
    sh ~/.fehbg &

# Lock screen
[[ "command -v xss-lock" ]] && \
    xset s 600 180 &
    xss-lock -l -- awful --capture &

# Start notification daemon
[[ "command -v dunst" ]] && \
    dunst &

# Sound daemon
[[ "command -v start-pulseaudio-x11" ]] && \
    start-pulseaudio-x11 &

# Terminal emulator
[[ "command -v urxvtd" ]] && \
    urxvtd -q -o -f &

# Start window manager
exec i3

# vim: set ft=sh:
