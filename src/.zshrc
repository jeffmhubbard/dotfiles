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
    fd \
    pass \
    git \
    forgit \
    tmux \
    virtualenv \
    fast-syntax-highlighting \
    zsh-autosuggestions \
    auto-notify \
    history \
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

# LS_COLORS
eval $(dircolors ~/.dircolors)

# aliases
#alias vi="vim" ### STOP TYPING VI ALREADY
alias ip="ip -c"

# update plugins
alias vim_upd="~/.vim/bundle && find . -name .git -type d -execdir git pull ';'"
alias omz_upd="~/.oh-my-zsh/custom/plugins && find . -name .git -type d -execdir git pull ';'"
alias tmux_upd="~/.tmux/plugins && find . -name .git -type d -execdir git pull ';'"

# package browser
alias pacbrowse="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --height=100% --bind 'enter:execute(pacman -Qil {} | less)'"

# fast pacman mirrorlist
alias pacfast="sudo reflector --country US --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

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
