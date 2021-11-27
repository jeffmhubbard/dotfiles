# .xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Path variables
export PATH=$PATH:$HOME/.bin

# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
#export XDG_RUNTIME_DIR=$HOME/.xdg
#export XDG_CURRENT_DESKTOP=AwesomeWM

# Common environment variables
export TERMINAL=kitty
export EDITOR=vim
export FILEXP=pcmanfm
export BROWSER=qutebrowser

# Make Qt themes follow Gtk (qt5-styleplugins)
export QT_QPA_PLATFORMTHEME=qt5ct

# Load X settings
xrdb -merge "$HOME/.Xresources"

# Set screen timeout
xset s 600 180 &

# Use left-facing pointer
xsetroot -cursor_name left_ptr &

# Start WM
exec awesome

# vim: set ft=sh ts=2 sw=0 et:
