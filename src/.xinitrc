#!/usr/bin/env bash
# extbin: xrdb, xsetroot, feh, compton, unclutter, dunst, xautolock, xtrlock, start-pulseaudio-x11, urxvtd, i3

# Environment variables
export MPD_HOST=pythos
export MPD_PORT=6600

# Load X settings
[[ -f ~/.Xresources ]] && \
    xrdb -merge -I$HOME ~/.Xresources

# Set mouse pointer
[[ "command -v xsetroot" ]] && \
    xsetroot -cursor_name left_ptr &

# Set random background color
[[ -f ~/.bin/xsetrbg ]] && \
    sh ~/.bin/xsetrbg Slate &

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
        -notify 30 \
        -notifier "notify-send -u critical -t 10000 Attention 'The screen will lock in 30 seconds.'" \
        -locker "xtrlock -b" \
        -nowlocker "xtrlock -b" \
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
