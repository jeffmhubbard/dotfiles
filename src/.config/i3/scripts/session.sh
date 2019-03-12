#!/usr/bin/env bash

# load i3 layout and start apps
HOSTNAME=$(hostname -s)

dunstify -u normal -t 1500 "Loading layouts for $HOSTNAME"

if [ $HOSTNAME == 'pythos' ]; then
    i3-msg "append_layout $HOME/.config/i3/layouts/layout-TERM.json"
    (urxvtc -name CAVA -title CAVA -e cava &)
    (urxvtc -name Htop -title Htop -e htop &)
    (urxvtc -name Vifm -title Vifm -e vifm &)
    (urxvtc &)
    (sleep)
    i3-msg "workspace 5; append_layout $HOME/.config/i3/layouts/layout-COMM.json"
    (urxvtc -name NeoMutt -title NeoMutt -e neomutt &)
    (urxvtc -name Irssi -title Irssi -e irssi &)
    (sleep)
    i3-msg "workspace 4; append_layout $HOME/.config/i3/layouts/layout-WEBS.json"
    (urxvtc -name RTV -title RTV -e rtv &)
    (qutebrowser &)
    (sleep)
fi

if [ $HOSTNAME == 'dragon' ]; then
    i3-msg "append_layout ~/.config/i3/layouts/layout-TERM.json"
    (urxvtc -name Htop -title Htop -e htop &)
    (urxvtc -name Vifm -title Vifm -e vifm &)
    (urxvtc &)

    i3-msg "workspace 4; append_layout ~/.config/i3/layouts/layout-WEBS.json"
    (qutebrowser &)

    i3-msg "workspace 5; append_layout ~/.config/i3/layouts/layout-COMM.json"
    (urxvtc -name NeoMutt -title NeoMutt -e neomutt &)
    (urxvtc -name Irssi -title Irssi -e irssi &)
fi

if [ $HOSTNAME == 'gargoyle' ]; then
    i3-msg "workspace 1; append_layout $HOME/.config/i3/layouts/layout-TERM.json"
    (urxvtc -name Htop -title Htop -e htop &)
    (urxvtc -name Vifm -title Vifm -e vifm &)
    (urxvtc &)
    (sleep)
    i3-msg "workspace 5; append_layout $HOME/.config/i3/layouts/layout-COMM.json"
    (urxvtc -name NeoMutt -title NeoMutt -e neomutt &)
    (urxvtc -name Irssi -title Irssi -e irssi &)
    (sleep)
    i3-msg "workspace 4; append_layout $HOME/.config/i3/layouts/layout-WEBS.json"
    (urxvtc -name RTV -title RTV -e rtv &)
    (qutebrowser &)
    (sleep)
fi

if [ $HOSTNAME == 'nebula' ]; then
    i3-msg "append_layout ~/.config/i3/layouts/layout-TERM.json"
    (urxvtc -name Htop -title Htop -e htop &)
    (urxvtc -name Vifm -title Vifm -e vifm &)
    (urxvtc &)

    i3-msg "workspace 4; append_layout ~/.config/i3/layouts/layout-WEBS.json"
    (qutebrowser &)

    i3-msg "workspace 5; append_layout ~/.config/i3/layouts/layout-COMM.json"
    (urxvtc -name NeoMutt -title NeoMutt -e neomutt &)
    (urxvtc -name Irssi -title Irssi -e irssi &)
fi

