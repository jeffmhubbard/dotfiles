#!/usr/bin/env bash

#
# load i3 layouts and start apps
#

# app shortcuts
_urxvt="urxvtc"
# _vifm="urxvtc -name Vifm -title Vifm -e vifm"
_ranger="urxvtc -name Ranger -title Ranger -e ranger"
# _vim="urxvtc -name Vim -title Vim -e vim"
_qutebrowser="qutebrowser"
_rtv="urxvtc -name RTV -title RTV -e rtv"
_neomutt="urxvtc -name NeoMutt -title NeoMutt -e neomutt"
_irssi="urxvtc -name Irssi -title Irssi -e irssi"
_htop="urxvtc -name Htop -title Htop -e htop"
_cava="urxvtc -name CAVA -title CAVA -e cava"

HOSTNAME=$(hostname)

# dunstify -u normal -t 1500 "Loading layouts for $HOSTNAME"

if [ "$HOSTNAME" == 'pythos' ]; then
    i3-msg "workspace 3; append_layout $HOME/.config/i3/layouts/$HOSTNAME/COMM.json"
    ( $_neomutt &)
    ( $_irssi &)
    (sleep)
    i3-msg "workspace 2; append_layout $HOME/.config/i3/layouts/$HOSTNAME/WEBS.json"
    ( $_qutebrowser &)
    ( $_rtv &)
    (sleep)
    i3-msg "workspace 1; append_layout $HOME/.config/i3/layouts/$HOSTNAME/TERM.json"
    ( $_urxvt &)
    ( $_ranger &)
    ( $_htop &)
    ( $_cava &)
    (sleep)
fi

if [ "$HOSTNAME" == 'dragon' ]; then
    (sleep)
    i3-msg "workspace 3; append_layout ~/.config/i3/layouts/$HOSTNAME/COMM.json"
    ( $_neomutt &)
    ( $_irssi &)
    (sleep)
    i3-msg "workspace 2; append_layout ~/.config/i3/layouts/$HOSTNAME/WEBS.json"
    ( $_qutebrowser &)
    (sleep)
    i3-msg "workspace 1; append_layout ~/.config/i3/layouts/$HOSTNAME/TERM.json"
    ( $_urxvt &)
    ( $_ranger &)
    ( $_htop &)
    (sleep)
fi

if [ "$HOSTNAME" == 'gargoyle' ]; then
    i3-msg "workspace 3; append_layout $HOME/.config/i3/layouts/$HOSTNAME/COMM.json"
    ( $_neomutt &)
    ( $_irssi &)
    (sleep)
    i3-msg "workspace 2; append_layout $HOME/.config/i3/layouts/$HOSTNAME/WEBS.json"
    ( $_qutebrowser &)
    ( $_rtv &)
    (sleep)
    i3-msg "workspace 1; append_layout $HOME/.config/i3/layouts/$HOSTNAME/TERM.json"
    ( $_urxvt &)
    ( $_ranger &)
    ( $_htop &)
    (sleep)
fi

