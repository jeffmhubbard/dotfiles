#!/usr/bin/env zsh

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

# GUI
export BROWSER=qutebrowser
export RTV_BROWSER=$BROWSER
export TERMINAL=alacritty

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_OPTS='
  --color=16
  --color=fg:-1,bg:-1,hl:9,fg+:15,bg+:-1,hl+:11
  --color=info:13,prompt:15,spinner:14,pointer:14,marker:9
'

# MPD
export MPD_HOST=localhost
export MPD_PORT=6600

# toggle-touchpad.sh
export TOUCHPAD='12'

# vim: set ft=zsh:
