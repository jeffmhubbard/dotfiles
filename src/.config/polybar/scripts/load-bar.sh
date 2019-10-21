#!/usr/bin/env bash

# polybar/scripts/load-bar.sh
#
# launch polybar based on hostname and displays
#
# extbin: pgrep, killall, xrandr, polybar

# kill existing polybar
killall -q polybar

# wait for it end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# get hostname
HOSTNAME="$(hostname -s)"

MONITORS=$(xrandr --listactivemonitors | wc -l)
((MONITORS--))

case "$HOSTNAME" in
  pythos)
    if [ "$MONITORS" -eq 2 ]
    then
        polybar pythos-left &
        sleep 1 &
        polybar pythos-right &
    else
        polybar pythos-bottom &
    fi
    ;;
  dragon) polybar dragon-bottom ;;
  gargoyle) polybar gargoyle-bottom ;;
  *) polybar base-bottom ;;
esac

exit 0

# vim: set ft=sh ts=2 sw=0 et:
