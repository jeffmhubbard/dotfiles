#!/usr/bin/env bash

# install.sh

#
# install dotfiles, zsh, and vim setups
#

SRC_DIR="./src/."
DST_DIR="$HOME"

cat << EOF

*** THIS SCRIPT DOES NOT MAKE BACKUPS ***
***       USE AT YOUR OWN RISK        ***

EOF

read -r -p "Install? [yn] " answer
if [ "$answer" = y ] ; then

    # prompt for zsh extras
    read -r -p "Run extras/zsh_setup.sh? [yn] " zanswer
    if [ "$zanswer" = y ] ; then
        sh extras/zsh_setup.sh
    fi

    # prompt for vim extras
    read -r -p "Run extras/vim_setup.sh? [yn] " vanswer
    if [ "$vanswer" = y ] ; then
        sh extras/vim_setup.sh
    fi

    echo "Copying dotfiles..."
    cp -r "$SRC_DIR" "$DST_DIR"

    echo "Done"
fi

# vim: set ft=sh:
