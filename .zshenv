#!/usr/bin/env zsh

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="
  --ansi
  --height 40%
  --color=dark
  --color=fg:-1,bg:-1,hl:11
  --color=fg+:15,bg+:-1,hl+:14
  --color=info:13,prompt:15,spinner:10
  --color=pointer:14,marker:9,header:8
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# forgit
export FORGIT_FZF_DEFAULT_OPTS="
  --exact
  --border
  --cycle
  --reverse
  --height 80%
"

# auto-notify
#export AUTO_NOTIFY_EXPIRE_TIME=300
#export AUTO_NOTIFY_THRESHOLD=60

#export AUTO_NOTIFY_IGNORE=( "vim" )

# Run using echo -e in order to make sure notify-send picks up new line
export AUTO_NOTIFY_TITLE="\"%command\" Complete"
export AUTO_NOTIFY_BODY="$(echo -e "Time: %elapsed seconds\nStatus: %exit_code")"

export AUTO_NOTIFY_WHITELIST=("pacman" "aur" "makepkg" "pip" "wget" "curl" "tar" "unzip" "dd")

# vim: set ft=zsh ts=2 sw=0 et:
