#!/usr/bin/env bash

# i3/scripts/backlight-osd.sh

# setup xob pipe
OSDPIPE="$HOME/.cache/xob/backlight.fifo"
[[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &>/dev/null

# set backlight
case "$1" in
  -u) xbacklight -inc "$2";;
  -d) xbacklight -dec "$2";;
  *) exit 1;;
esac

# display current level
LEVEL=$(xbacklight -get)
printf "%.0f\n" "$LEVEL" > "$OSDPIPE"

exit 0

# vim: ft=sh ts=2 sw=0 et:
