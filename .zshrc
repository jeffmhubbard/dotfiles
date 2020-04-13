#!/usr/bin/zsh

# oh-my-zsh path
export ZSH=~/.oh-my-zsh

# oh-my-zsh env
ZSH_THEME="antsy"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=( \
  archlinux \
  systemd \
  command-not-found \
  colored-man-pages \
  ssh-agent \
  gpg-agent \
  vi-mode \
  fzf \
  z \
  fz \
  fd \
  pass \
  git \
  forgit \
  tmux \
  virtualenv \
  autoswitch_virtualenv \
  autopair \
  fast-syntax-highlighting \
  zsh-autosuggestions \
  history \
  you-should-use \
  auto-notify \
  antsy \
)

# oh-my-zsh init
source $ZSH/oh-my-zsh.sh

# env
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export HISTSIZE=9999
export SAVEHIST=1000

## Copied from lib/key-bindings.zsh
## Fix up arrow history in vi-mode
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# LS_COLORS
# https://github.com/trapd00r/LS_COLORS
eval $(dircolors ~/.dircolors)

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff
export LESS=' -RF '

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
  --ansi
  --height 40%
  --color=dark
  --color=fg:-1,bg:-1,hl:11
  --color=fg+:15,bg+:-1,hl+:14
  --color=info:13,prompt:15,spinner:10
  --color=pointer:14,marker:9,header:8
  --exact
  --border sharp
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

# autoswitch_virtualenv
#export AUTOSWITCH_MESSAGE_FORMAT="Activating %venv_type: ${BOLD}${PURPLE}%venv_name${NORMAL} ${GREEN}[ %py_version]${NORMAL}"
export AUTOSWITCH_MESSAGE_FORMAT="$(tput bold)$(tput setaf 7) $(tput sgr0)\
Activating $(tput bold)$(tput setaf 3)%venv_type$(tput sgr0): \
$(tput bold)$(tput setaf 6)%venv_name$(tput sgr0) \
$(tput bold)$(tput setaf 2) %py_version$(tput sgr0)"

# vim: set ft=zsh ts=2 sw=0 et:
