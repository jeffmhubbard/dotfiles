# .xinitrc

# Path variables
export PATH=$PATH:$HOME/.bin

# XDG paths
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
#export XDG_RUNTIME_DIR=~/.xdg

# Common environment variables
export TERMINAL=termite
export EDITOR=vim
export BROWSER=qutebrowser
export QT_QPA_PLATFORMTHEME=qt5ct
export AUR_PAGER=ranger

# Load X settings
xrdb -merge "$HOME/.Xresources"

# Set screen timeout
xset s 600 180 &

# Use left-facing pointer
xsetroot -cursor_name left_ptr &

# Start WM
exec awesome

exit 0

# vim: set ft=sh ts=2 sw=0 et:
