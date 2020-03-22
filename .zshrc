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
  fast-syntax-highlighting \
  zsh-autosuggestions \
  history \
  you-should-use \
  auto-notify \
  antsy \
)

# oh-my-zsh init
source $ZSH/oh-my-zsh.sh

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

# env
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export HISTSIZE=9999
export SAVEHIST=1000

# vim: set ft=zsh ts=2 sw=0 et:
