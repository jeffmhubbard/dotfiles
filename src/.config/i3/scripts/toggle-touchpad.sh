#!/usr/bin/env bash

ICON=/usr/share/icons/oomox-antsy/devices/scalable/input-mouse.svg

declare -i ID
if [[ -n $TOUCHPAD ]]; then
    ID="$TOUCHPAD"
else
    ID=$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}')
fi

declare -i STATE
STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')

if [ "$STATE" -eq 1 ]
then
    xinput disable "$ID"
    CURSTATE="Touchpad Disabled"
else
    xinput enable "$ID"
    CURSTATE="Touchpad Enabled"
fi

dunstify -u normal -t 2500 "$CURSTATE" -i "$ICON"
