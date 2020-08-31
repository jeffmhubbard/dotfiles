#!/usr/bin/env bash

# modular .xinitrc
# sources config files from ~/.xinit.d

# setup some paths
INIT_DIR="$HOME/.xinit.d"
WM_DIR="$HOME/.config/i3"
WM_CONF="$WM_DIR/$HOSTNAME.conf"
WM_BAR="$WM_DIR/status/$HOSTNAME.conf"

# source conf files in INIT_DIR
for conf in "${INIT_DIR}"/*.conf; do
  source "$conf"
done
unset conf

# get WM config
if [[ ! -f "$WM_CONF" ]]; then
  WM_CONF="$WM_DIR/default.conf"
fi
export WM_CONF=$WM_CONF

# get WM bar
if [[ ! -f "$WM_BAR" ]]; then
  WM_BAR="$WM_DIR/status/default.conf"
fi
export WM_BAR=$WM_BAR

# start WM
exec i3 -c "$WM_CONF"

exit 0

# vim: set ft=sh ts=2 sw=0 et:
