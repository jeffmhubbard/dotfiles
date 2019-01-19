#!/usr/bin/env zsh

# PATHS
export PATH=$HOME/.bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

# GUI
export BROWSER=/usr/bin/qutebrowser
export RTV_BROWSER=$BROWSER
export TERMINAL=urxvtc

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_OPTS='
  --color=16
  --color=fg:-1,bg:-1,hl:9,fg+:15,bg+:-1,hl+:11
  --color=info:13,prompt:15,spinner:14,pointer:10,marker:9
'

# MPD
export MPD_HOST=pythos
export MPD_PORT=6600

# vim: set ft=zsh:
