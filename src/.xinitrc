#!/usr/bin/env bash
# extbin: xrdb, xsetroot, feh, compton, unclutter, dunst, xautolock,
#       betterlockscreen, start-pulseaudio-x11, urxvtd, i3

# Environment variables
export MPD_HOST=pythos
export MPD_PORT=6600
export QT_QPA_PLATFORMTHEME=gtk2

# Load X settings
[[ -f ~/.Xresources ]] && \
    xrdb -merge -I$HOME ~/.Xresources

# Extra X settings
[[ "command -v xsetroot" ]] && \
    xsetroot -solid grey20 -cursor_name left_ptr &

# Disable DPMS
[[ "command -v xset" ]] && \
    xset s off -dpms &

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
[[ "command -v xautolock" ]] && \
    xautolock -resetsaver \
        -time 5 \
        -locker "betterlockscreen -l blur" \
        -nowlocker "betterlockscreen -l blur" \
        &

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
