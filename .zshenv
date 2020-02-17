#!/usr/bin/env zsh

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff
export LESS=' -RF '
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
  --ansi
  --height 40%
  --color=dark
  --color=fg:-1,bg:-1,hl:11
  --color=fg+:15,bg+:-1,hl+:14
  --color=info:13,prompt:15,spinner:10
  --color=pointer:14,marker:9,header:8
"

# forgit
export FORGIT_FZF_DEFAULT_OPTS="
  --exact
  --border
  --cycle
  --reverse
  --height 80%
"

# auto-notify
export AUTO_NOTIFY_EXPIRE_TIME=600
export AUTO_NOTIFY_THRESHOLD=60
export AUTO_NOTIFY_WHITELIST=("pacman" "aur" "makepkg" "pip" "wget" "curl" "tar" "unzip" "dd")

# you-should-use
export YSU_MODE=BESTMATCH
export YSU_MESSAGE_FORMAT="$(tput bold)$(tput setaf 7) $(tput sgr0)\
Found $(tput bold)$(tput setaf 3)%alias_type$(tput sgr0) for \
$(tput bold)$(tput setaf 6)%command$(tput sgr0), \
use: $(tput smul)$(tput setaf 2)%alias$(tput sgr0)"

# vim: set ft=zsh ts=2 sw=0 et:
