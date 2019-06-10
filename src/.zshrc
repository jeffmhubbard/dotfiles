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
        ssh-agent \
        gpg-agent \
        vi-mode \
        fzf \
        pass \
        git \
        tmux \
        virtualenv \
        fast-syntax-highlighting \
        history \
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

# update plugins
alias vim_upd="~/.vim/bundle && find . -name .git -type d -execdir git pull ';'"
alias omz_upd="~/.oh-my-zsh/custom/plugins && find . -name .git -type d -execdir git pull ';'"

# google music
alias pf="playfetch"
alias pfsh="playfetch shell"

# calendar
alias week="gcalcli calw"
alias month="gcalcli calm"

# weather
alias weather="curl -s 'wttr.in/aus?0'"
alias forecast="curl -s 'wttr.in/aus'"

# vim: set ft=zsh:
