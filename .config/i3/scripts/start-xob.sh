#!/usr/bin/env bash

XOB_DIR="$HOME/.config/xob"

for bar in "$XOB_DIR"/*.sh; do
    bash "$bar"
done

exit 0
