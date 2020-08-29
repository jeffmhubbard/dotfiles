#!/usr/bin/env bash

# script should be named after styles defined in styles.cfg
# $ cp bar.example volume.sh

NAME=$(basename "${0%.*}")

CACHE_DIR="$HOME/.cache/xob"
OSD_PIPE="$CACHE_DIR/$NAME.fifo"
OSD_PID="$CACHE_DIR/$NAME.pid"

# check cache directory
[[ -d "$CACHE_DIR" ]] || \
    mkdir -p "$CACHE_DIR" &>/dev/null

# check named pipe
[[ -p "$OSD_PIPE" ]] || \
    mkfifo "$OSD_PIPE" &>/dev/null

# check pid file
[[ -f "$OSD_PID" ]] || \
    touch "$OSD_PID" &>/dev/null

# kill running instance
OLD_PID=$(head -n 1 "$OSD_PID")
kill -9 "$OLD_PID" &>/dev/null

# watch pipe
tail -f "$OSD_PIPE" | xob -s "$NAME" &

# write pid
jobs -p > "$OSD_PID"

