#!/usr/bin/env bash

# volume-osd.sh
# raise, lower, and mute volume with pamixer
# get OSD feedback with xob

OSDPIPE="$HOME/.cache/xob/volume.fifo"

while getopts u:d:m ARGS; do
  case "${ARGS}" in
    u) pamixer -i "$OPTARG";;
    d) pamixer -d "$OPTARG";;
    m) pamixer -t;;
    *) exit 1;;
  esac
done
shift $((OPTIND-1))

if [[ -p "$OSDPIPE" ]]; then
  VOLUME=$(pamixer --get-volume)
  MUTED=$(pamixer --get-mute)
  [[ "$MUTED" = true ]] && MI="!"
  echo "$VOLUME$MI" > "$OSDPIPE"
fi

exit 0

# vim: ft=sh ts=2 sw=0 et:
