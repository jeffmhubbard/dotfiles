#!/usr/bin/env bash

# launch polybar based on hostname and displays
#
# extbin: pgrep, killall, polybar

# kill existing polybar
killall -q polybar

# wait for it end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

conf="$HOME/.config/polybar/$HOSTNAME.conf"
if [ -f "$conf" ]
then
  if [ "$(polybar -m | wc -l)" -eq 2 ]
  then
      polybar -c "$conf" left &
      sleep 1 &
      polybar -c "$conf" right &
  else
      polybar -c "$conf" bottom &
  fi
else
  echo "ERROR: no config found! $conf"
  exit 1
fi

exit 0

# vim: set ft=sh ts=2 sw=0 et:
