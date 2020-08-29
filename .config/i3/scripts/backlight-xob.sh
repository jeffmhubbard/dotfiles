#!/usr/bin/env bash

# backlight-xob.sh

# setup xob pipe
XOB="$HOME/.cache/xob/backlight.fifo"

# set backlight
case "$1" in
  -u) xbacklight -inc "$2";;
  -d) xbacklight -dec "$2";;
  *) exit 1;;
esac

# display current level
LEVEL=$(xbacklight -get)
printf "%.0f\n" "$LEVEL" > "$XOB"

exit 0

# vim: ft=sh ts=2 sw=0 et:
