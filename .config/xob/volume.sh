#!/usr/bin/env bash

cache="$HOME/.cache/xob"    # this is the only "setting"
style=$(basename "${0%.*}")
pipe="$cache/$style.fifo"
pid="$cache/$style.pid"

[[ -d "$cache" ]] || mkdir -p "$cache" &>/dev/null
[[ -p "$pipe" ]] || mkfifo "$pipe" &>/dev/null
[[ -f "$pid" ]] || touch "$pid" &>/dev/null

last=$(head -n 1 "$pid")
for id in $(pgrep -f "$style"); do
    [[ "$id" -eq "$last" ]] && kill -9 "$last" &>/dev/null
done; unset id

tail -f "$pipe" | xob -s "$style" &
jobs -p > "$pid"
