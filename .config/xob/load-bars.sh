#!/usr/bin/env bash

# xob/load-bars.sh

BARS=(volume backlight)         # bars must be specified in styles.cfg
CACHE_DIR="$HOME/.cache/xob"    # directory where pipes will be created

# create cache dir
mkdir "$CACHE_DIR" &> /dev/null

# execute bars
for bar in "${BARS[@]}"; do
  OSDPIPE="$CACHE_DIR/$bar.fifo"
  [[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &>/dev/null

  (tail -f "$OSDPIPE" | xob -s "$bar")&
done

exit 0

# vim: ft=sh ts=2 sw=0 et:
