#!/usr/bin/env bash

# install.sh

#
# install dotfiles, zsh, and vim setups
#

SRC_DIR="./src/."
DST_DIR="$HOME"

cat << EOF

****** THIS SCRIPT DOES NOT MAKE BACKUPS ******
******       USE AT YOUR OWN RISK        ******

You will be prompted to install extras for zsh,
vim, and tmux. They are optional, but are very
much recommended (read: required).

EOF

read -r -p "Install? [y/n] " answer
if [ "$answer" = y ] ; then

    # prompt for zsh extras
    read -r -p "Run extras/zsh_setup.sh? [y/n] " zanswer
    if [ "$zanswer" = y ] ; then
        sh extras/zsh_setup.sh
    fi

    # prompt for vim extras
    read -r -p "Run extras/vim_setup.sh? [y/n] " vanswer
    if [ "$vanswer" = y ] ; then
        sh extras/vim_setup.sh
    fi

    # prompt for tmux extras
    read -r -p "Run extras/tmux_setup.sh? [y/n] " tanswer
    if [ "$tanswer" = y ] ; then
        sh extras/tmux_setup.sh
    fi

    echo "Copying dotfiles..."
    cp -r "$SRC_DIR" "$DST_DIR"

    echo "Done"
fi

# vim: set ft=sh:
