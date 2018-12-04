#!/usr/bin/env bash
# extbin: xrdb, sxhkd, dunst, xsetroot, unclutter, start-pulseaudio-x11, bspwm
export MPD_HOST=python
export MPD_PORT=6600
# Load X settings
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# X compositor
[[ "command -v compton" ]] && compton &

# Start keybind daemon
#[[ "command -v sxhkd" ]] && sxhkd &

# Start notification daemon
[[ "command -v dunst" ]] && dunst &

# Sound daemon
[[ "command -v start-pulseaudio-x11" ]] && start-pulseaudio-x11 &

# terminal emulator
[[ "command -v urxvtd" ]] && urxvtd -q -o -f &

# Hide mouse cursor when not in use
[[ "command -v unclutter" ]] && unclutter -root &

# Set mouse pointer
[[ "command -v xsetroot" ]] && xsetroot -cursor_name left_ptr &

# Set random background color
[[ -f ~/.bin/xsetrbg ]] && sh ~/.bin/xsetrbg &

# Restore wallpaper
[[ -f ~/.fehbg ]] && sh ~/.fehbg &

# Screenlocker
#xautolock -resetsaver \
#    -time 10 \
#    -notify 30 \
#    -notifier "notify-send -u low -t 10000 Attention 'The screen will lock in 30 seconds.'" \
#    -locker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
#    -nowlocker "csxlock -f '-misc-hack nerd font-medium-r-normal--0-0-0-0-p-0-iso8859-1' -b '#000000' -o '#ffffff' -w '#ff0000'" \
#    &

# Start window manager
#exec bspwm
exec i3

# vim: set ft=sh:
