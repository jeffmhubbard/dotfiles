#!/usr/bin/env bash

# i3/scripts/backlight-osd.sh

OSDPIPE="$HOME/.cache/xob/backlight.fifo"

ARG="$1"
VAL="$2"

if [[ -z "$ARG" ]]; then
  exit 1
fi

case "$ARG" in
  u) STAT=$(brightnessctl s +"$VAL"% -m);;
  d) STAT=$(brightnessctl s "$VAL"%- -m);;
  *) exit 1;;
esac

if [[ -p "$OSDPIPE" ]]; then
  IFS="," read -ra CUR <<< "$STAT"
  BRIGHT="${CUR[3]/%/}"
  echo "$BRIGHT"
  echo "$BRIGHT" > "$OSDPIPE"
fi

exit 0

# vim: ft=sh ts=2 sw=0 et:
