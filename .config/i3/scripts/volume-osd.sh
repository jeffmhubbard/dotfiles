#!/usr/bin/env bash

# i3/scripts/volume-osd.sh

# setup xob pipe
OSDPIPE="$HOME/.cache/xob/volume.fifo"
[[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &>/dev/null

# set volume or mute
case "$1" in
  -u) pamixer -i "$2";;
  -d) pamixer -d "$2";;
  -m) pamixer -t;;
  *) exit 1;;
esac

# display current level
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)
[[ "$MUTED" = true ]] && MI="!"
echo "$VOLUME$MI" > "$OSDPIPE"

exit 0

# vim: ft=sh ts=2 sw=0 et:
