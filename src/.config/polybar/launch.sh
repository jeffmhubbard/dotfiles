#!/bin/sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

case $(hostname) in
    dragon)       
        if [ $((`xrandr --listactivemonitors | wc -l`-1)) -eq 2 ]; then
            polybar dragon-left &
            polybar dragon-right &
        else
            polybar dragon-bottom &
        fi
        ;;
    gargoyle)
        polybar gargoyle-bottom &
        ;;            
    *)              
        polybar base-bottom &
esac 

# vim: set ft=sh :
