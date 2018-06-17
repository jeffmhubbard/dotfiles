##  File: .zshenv
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 17, 2018

export PATH=$HOME/.bin:$PATH

export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

export BROWSER=/usr/bin/qutebrowser
export RTV_BROWSER=$BROWSER
export TERM=rxvt-unicode-256color
export TERMINAL=urxvt

export QT_QPA_PLATFORMTHEME=gtk2
export MPD_HOST=python
export MPD_PORT=6600

eval $(dircolors -b $HOME/.dircolors)

# vim: set ft=zsh:
