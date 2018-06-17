##  File: .zshrc
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 17, 2018

export ZSH=~/.oh-my-zsh

ZSH_THEME="antsy"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=( \
        archlinux \
        systemd \
        history \
        command-not-found \
        tmux \
        git \
        ssh-agent \
        virtualenv \
        django \
        fabric \
        )

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export HISTSIZE=9999
export SAVEHIST=1000

# aliases
alias vi="vim"

# vim: set ft=zsh:
