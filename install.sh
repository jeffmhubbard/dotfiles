#!/usr/bin/env bash

# install.sh

#
# install dotfiles, zsh, vim, and tmux setups
#

SRC_DIR="./src/."
DST_DIR="$HOME"

cat << EOF

****** THIS SCRIPT DOES NOT MAKE BACKUPS ******
******       USE AT YOUR OWN RISK        ******

EOF

read -r -e -n1 -p "Continue? [y/n] " dotsIn
if [ ! "$dotsIn" = y ] ; then
  echo
  echo "Wokay?!"
fi

# prompt for zsh extras
read -r -e -n1 -p "Run Zsh Setup? [y/n] " zshIn
if [ "$zshIn" = y ] ; then
  bash extras/zsh_setup.sh
fi

# prompt for vim extras
read -r -e -n1 -p "Run Vim Setup? [y/n] " vimIn
if [ "$vimIn" = y ] ; then
  bash extras/vim_setup.sh
fi

# prompt for tmux extras
read -r -e -n1 -p "Run Tmux Setup? [y/n] " tmuxIn
if [ "$tmuxIn" = y ] ; then
  bash extras/tmux_setup.sh
fi

read -r -e -n1 -p "Copy dotfiles? [y/n] " dotsCp
if [ "$dotsCp" = y ] ; then
  echo
  echo "Copying dotfiles..."
  cp -r "$SRC_DIR" "$DST_DIR"
  echo "Done"
fi

# vim: set ft=bash ts=2 sw=0 et:
