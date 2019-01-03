#!/usr/bin/env bash
# extbin: xrdb, xsetroot, feh, compton, unclutter, dunst, xautolock,
#       betterlockscreen, start-pulseaudio-x11, urxvtd, i3

# Environment variables
export QT_QPA_PLATFORMTHEME=gtk2
export MPD_HOST=pythos
export MPD_PORT=6600

# Load X settings
[[ -f ~/.Xresources ]] && \
    xrdb -merge -I$HOME ~/.Xresources

# Set mouse pointer
[[ "command -v xsetroot" ]] && \
    xsetroot -cursor_name left_ptr &

# Set random background color
[[ "command -v xset" ]] && \
    xset s off -dpms &

# Restore wallpaper
[[ -f ~/.fehbg ]] && \
    sh ~/.fehbg &

# X compositor
[[ "command -v compton" ]] && \
    compton &

# Hide idle mouse cursor
[[ "command -v unclutter" ]] && \
    unclutter -root &

# Start notification daemon
[[ "command -v dunst" ]] && \
    dunst &

# Lock screen
[[ "command -v xautolock" ]] && \
    xautolock -resetsaver \
        -time 10 \
        -locker "betterlockscreen -l dim" \
        -nowlocker "betterlockscreen -l dim" \
        &

# Sound daemon
[[ "command -v start-pulseaudio-x11" ]] && \
    start-pulseaudio-x11 &

# Terminal emulator
[[ "command -v urxvtd" ]] && \
    urxvtd -q -o -f &

# Start window manager
exec i3

# vim: set ft=sh:
