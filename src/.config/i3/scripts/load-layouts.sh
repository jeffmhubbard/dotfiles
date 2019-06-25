#!/usr/bin/env bash

#
# load i3 layouts and start apps
#

# app shortcuts
_urxvt="urxvtc -name URxvt -title URxvt -e zsh"
_ranger="urxvtc -name Ranger -title Ranger -e ranger"
_qutebrowser="qutebrowser"
_rtv="urxvtc -name RTV -title RTV -e rtv"
_neomutt="urxvtc -name NeoMutt -title NeoMutt -e neomutt"
_irssi="urxvtc -name Irssi -title Irssi -e irssi"
_htop="urxvtc -name Htop -title Htop -e htop"
_cava="urxvtc -name CAVA -title CAVA -e cava"

LAYOUT_DIR=$HOME/.cache/i3/layouts
SESSION_DIR=$HOME/.cache/i3/sessions


if [ "$HOSTNAME" == 'pythos' ]; then
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/WEBS.json"
    ( $_qutebrowser & )
    ( $_rtv & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
    ( $_cava & )
fi

if [ "$HOSTNAME" == 'dragon' ]; then
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/WEBS.json"
    ( $_qutebrowser & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
fi

if [ "$HOSTNAME" == 'gargoyle' ]; then
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/WEBS.json"
    ( $_qutebrowser & )
    ( $_rtv & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
fi
