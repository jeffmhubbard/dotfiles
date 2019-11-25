#!/usr/bin/env zsh

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS='
  --ansi
  --height 40%
  --color=dark
  --color=fg:-1,bg:-1,hl:11
  --color=fg+:15,bg+:-1,hl+:14
  --color=info:13,prompt:15,spinner:10
  --color=pointer:14,marker:9,header:8
'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# vim: set ft=zsh:
