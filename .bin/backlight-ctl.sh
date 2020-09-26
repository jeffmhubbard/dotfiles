#!/usr/bin/env bash

# backlight-ctl.sh

# setup xob pipe
xobpipe="$HOME/.cache/xob/backlight.fifo"

# set backlight
case "$1" in
  -u) xbacklight -inc "$2";;
  -d) xbacklight -dec "$2";;
  *) exit 1;;
esac

# display current level
level=$(xbacklight -get)
printf "%.0f\n" "$level" > "$xobpipe"

exit 0

# vim: ft=sh ts=2 sw=0 et:
