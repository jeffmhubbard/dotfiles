#!/usr/bin/env bash
# extbin: pgrep, killall, xrandr, polybar

# polybar/launch.sh

# kill existing polybar
killall -q polybar

# wait for it end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# get hostname
HOSTNAME="$(hostname -s)"
# pythos
if [ ${HOSTNAME} = "pythos" ]; then
    # check for dual screen and load two bars
    if [ $((`xrandr --listactivemonitors | wc -l`-1)) -eq 2 ]; then
        polybar pythos-left &
        sleep 1 &
        polybar pythos-right &
    else
        polybar pythos-top &
    fi
fi

# dragon
if [ ${HOSTNAME} = "dragon" ]; then
    # check for dual screen and load two bars
    if [ $((`xrandr --listactivemonitors | wc -l`-1)) -eq 2 ]; then
        polybar dragon-left &
        sleep 1 &
        polybar dragon-right &
    else
        polybar dragon-top &
    fi
fi

# gargoyle
if [ ${HOSTNAME} = "gargoyle" ]; then
    polybar gargoyle-top &
fi

# pegasus
if [ ${HOSTNAME} = "pegasus" ]; then
    polybar pegasus-top &
fi

# vim: set ft=sh:
