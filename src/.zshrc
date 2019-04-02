#!/usr/bin/zsh

# oh-my-zsh path
export ZSH=~/.oh-my-zsh

# oh-my-zsh env
ZSH_THEME="antsy"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=( \
        ssh-agent \
        gpg-agent \
        archlinux \
        systemd \
        fzf \
        pass \
        git \
        tmux \
        virtualenv \
        history \
        command-not-found \
        fast-syntax-highlighting \
        )

# oh-my-zsh init
source $ZSH/oh-my-zsh.sh

# env
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export HISTSIZE=9999
export SAVEHIST=1000

# LS_COLORS
eval $(dircolors ~/.dircolors)

# aliases
alias vi="vim"
alias vim_up="~/.vim/bundle && find . -name .git -type d -execdir git pull ';'"

alias pf="playfetch"

alias week='gcalcli calw'
alias month='gcalcli calm'

# vim: set ft=zsh:
