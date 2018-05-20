#!/bin/sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

case $(hostname) in
    dragon)       
        polybar dragon-left &
        polybar dragon-right &
        ;;
    gargoyle)
        polybar gargoyle-bottom &
        ;;            
    *)              
        polybar base-bottom &
esac 

