#!/usr/bin/env bash

#
# load i3 layouts and start apps
#

# app shortcuts
_urxvt="urxvtc"
_ranger="urxvtc -name Ranger -title Ranger -e ranger"
_vim="urxvtc -name Vim -title Vim -e vim"
_qutebrowser="qutebrowser"
_rtv="urxvtc -name RTV -title RTV -e rtv"
_neomutt="urxvtc -name NeoMutt -title NeoMutt -e neomutt"
_irssi="urxvtc -name Irssi -title Irssi -e irssi"
_htop="urxvtc -name Htop -title Htop -e htop"
_cava="urxvtc -name CAVA -title CAVA -e cava"

HOSTNAME=$(hostname)
LAYOUT_DIR=$HOME/.config/i3/layouts

if [ "$HOSTNAME" == 'pythos' ]; then
    i3-msg "workspace 4; append_layout $LAYOUT_DIR/$HOSTNAME/CODE.json"
    ( $_vim & )
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/$HOSTNAME/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/$HOSTNAME/WEBS.json"
    ( $_qutebrowser & )
    ( $_rtv & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/$HOSTNAME/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
    ( $_cava & )
fi

if [ "$HOSTNAME" == 'dragon' ]; then
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/$HOSTNAME/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/$HOSTNAME/WEBS.json"
    ( $_qutebrowser & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/$HOSTNAME/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
fi

if [ "$HOSTNAME" == 'gargoyle' ]; then
    i3-msg "workspace 4; append_layout $LAYOUT_DIR/$HOSTNAME/CODE.json"
    ( $_vim & )
    i3-msg "workspace 3; append_layout $LAYOUT_DIR/$HOSTNAME/COMM.json"
    ( $_neomutt & )
    ( $_irssi & )
    i3-msg "workspace 2; append_layout $LAYOUT_DIR/$HOSTNAME/WEBS.json"
    ( $_qutebrowser & )
    ( $_rtv & )
    i3-msg "workspace 1; append_layout $LAYOUT_DIR/$HOSTNAME/TERM.json"
    ( $_urxvt & )
    ( $_ranger & )
    ( $_htop & )
fi
