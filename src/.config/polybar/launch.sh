#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#if [[ $(hostname) == dragon ]]; then
#    polybar left &
#    polybar right &
#else
#    polybar bottom &
#fi

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

