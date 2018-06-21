#!/usr/bin/zsh

##  File: .zshenv
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 21, 2018

# PATHS
export PATH=$HOME/.bin:$PATH

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

# GUI
export BROWSER=/usr/bin/qutebrowser
export RTV_BROWSER=$BROWSER
export TERMINAL=urxvt

# MISC
export QT_QPA_PLATFORMTHEME=gtk2
export MPD_HOST=python
export MPD_PORT=6600

# vim: set ft=zsh:
