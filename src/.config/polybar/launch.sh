#!/bin/sh

##  File: polybar/launch.sh
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 10, 2018

# kill existing polybar
killall -q polybar
# wait for it end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# dragon
if [ $(hostname) = "dragon" ]; then
    # check for dual screen and load two bars
    if [ $((`xrandr --listactivemonitors | wc -l`-1)) -eq 2 ]; then
        polybar dragon-left &
        polybar dragon-right &
    else
        polybar dragon-bottom &
    fi
fi

# gargoyle
if [ $(hostname) = "gargoyle" ]; then
    polybar gargoyle-bottom &
fi

# if no bar was started, use base
if [ $(( `pgrep -u $UID -x polybar | wc -l` )) -eq 0 ]; then
    polybar base-bottom &
fi

# vim: set ft=sh:
