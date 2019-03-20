#!/usr/bin/env bash
# extbin: pgrep, killall, xrandr, polybar

# polybar/scripts/launch.sh
#
# launch polybar based on hostname and displays
#

# kill existing polybar
killall -q polybar

# wait for it end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# get hostname
HOSTNAME="$(hostname -s)"
MONITORS=$(xrandr --listactivemonitors | wc -l)

# pythos
if [ "$HOSTNAME" = "pythos" ]; then
    ((MONITORS--))
    if [ "$MONITORS" -eq 2 ]; then
        polybar pythos-left &
        sleep 1 &
        polybar pythos-right &
    else
        polybar pythos-bottom &
    fi
fi

# dragon
if [ "$HOSTNAME" = "dragon" ]; then
    ((MONITORS--))
    if [ "$MONITORS" -eq 2 ]; then
        polybar dragon-left &
        sleep 1 &
        polybar dragon-right &
    else
        polybar dragon-bottom &
    fi
fi

# gargoyle
if [ "$HOSTNAME" = "gargoyle" ]; then
    polybar gargoyle-bottom &
fi

# pegasus
if [ "$HOSTNAME" = "pegasus" ]; then
    polybar pegasus-bottom &
fi

# vim: set ft=sh:
