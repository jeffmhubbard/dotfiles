#!/usr/bin/env bash

# volume-ctl.sh

# xob pipe
xobpipe="$HOME/.cache/xob/volume.fifo"

# set volume or mute
case "$1" in
  -u) pamixer -i "$2";;
  -d) pamixer -d "$2";;
  -m) pamixer -t;;
  *) exit 1;;
esac

# display current level
volume=$(pamixer --get-volume)
muted=$(pamixer --get-mute)
[[ "$muted" = true ]] && alt="!"
echo "$volume$alt" > "$xobpipe"

exit 0

# vim: ft=sh ts=2 sw=0 et:
