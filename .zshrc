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
)

# oh-my-zsh init
source $ZSH/oh-my-zsh.sh

# env
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export HISTSIZE=9999
export SAVEHIST=1000

# PATHS
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

# TEXT
export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff
export LESS=' -RF '

# Aliases
#
# bat
# https://github.com/sharkdp/bat
(( $+commands[bat] )) && alias cat="bat"

# ip color output
(( $+commands[ip] )) && alias ip="ip -c"


(( $+commands[ps] )) && alias ptop="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"

# weather
# http://wttr.in/
if (( $+commands[curl] ))
then
    alias weather="curl -s 'wttr.in/aus?0'"
    alias forecast="curl -s 'wttr.in/aus'"
fi

if (( $+commands[git] ))
then
    # dotfiles git alias
    # https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
    alias dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    # update plugins
    alias update_vim_plugins="~/.vim/bundle && find . -name .git -type d -execdir git pull ';'"
    alias update_zsh_plugins="~/.oh-my-zsh/custom/plugins && find . -name .git -type d -execdir git pull ';'"
    alias update_tmux_plugins="~/.tmux/plugins && find . -name .git -type d -execdir git pull ';'"
fi

# Arch specific
#
# pacman browser with fzf
if (( $+commands[fzf] ))
then
    alias pacbrowse="pacman -Qq | \
        fzf \
            --preview 'pacman -Qil {}' \
            --layout=reverse \
            --height=100% \
            --bind 'enter:execute(pacman -Qil {} | less)'"
fi

# get fast pacman mirrors
if (( $+commands[reflector] ))
then
    alias pacfast="sudo \
        reflector \
            --country US \
            --age 12 \
            --protocol https \
            --sort rate \
            --save /etc/pacman.d/mirrorlist \
            --verbose"
fi

# App specific
#
# google calendar
# https://github.com/insanum/gcalcli
if (( $+commands[gcalcli] ))
then
    alias calw="gcalcli calw"
    alias week="gcalcli calw"
    alias calm="gcalcli calm"
    alias month="gcalcli calm"
    alias calag="gcalcli agenda "
    alias calrem="gcalcli remind "
    alias cala="gcalcli add"
    alias calq="gcalcli quick"
    alias cald="gcalcli delete "
    alias calup="gcalcli updates "
fi

# playz
# pzp requires fzf
if (( $+commands[playz] && $+commands[mpc] ))
then
    alias pz="playz "
    alias pzs="_playz_search "
    alias pzr="_playz_radio "
    alias pzt="_playz_toptracks "
    alias pzd="_playz_discog "
    alias pzcur="playz -Sc -A"
    alias pzc="playz -F -A"
    alias pzl="playz -Fl -t 100 -A"
    alias pz!="playz -Ft -A"
    alias pzp="_playz_picker"
    alias pz+="playz -Tu"
    alias pz-="playz -Td"
    alias pzm="playz -M"
    alias pzml="playz -Ml"
    alias pz@="playz -Mt"
    alias pz.="playz -Mn"
    alias pz,="playz -Mp"
    alias pz#="playz -Ms"

    function _playz_search() { [ -n $@ ] && playz -S "$1" -A; }
    function _playz_radio() { [ -n $@ ] && playz -Sr "$1" -A; }
    function _playz_toptracks() { [ -n $@ ] && playz -St "$1" -A; }
    function _playz_discog() { [ -n $@ ] && playz -Sd "$1" -A; }
    function _playz_picker() {
        local pldir=$HOME/.config/mpd/playlists
        local plist=$(mpc lsplaylists | sort | \
            fzf +m --layout=reverse-list \
                --prompt="▶ " \
                --preview "less ${MPD_PLAYLISTS:-$pldir}/{}.m3u")
        if [[ -n $plist ]]
        then
            mpc clear &>/dev/null
            mpc load $plist &>/dev/null
            mpc play
        fi
    }
fi

# Functions
#
# calculate distance between two hex colors
# using Euclidean formula
# https://en.wikipedia.org/wiki/Color_difference
function color_dist() {
    local color1=($(hex2rgb $1))
    local color2=($(hex2rgb $2))
    local red=$(echo "var=$color1[1]-$color2[1];var*var" | bc)
    local green=$(echo "var=$color1[2]-$color2[2];var*var" | bc)
    local blue=$(echo "var=$color1[3]-$color2[3];var*var" | bc)
    echo "sqrt ( $red + $green + $blue )" | bc
}

# convert rgb color (128 128 128) to hex (808080)
function rgb2hex() { printf "%02x%02x%02x\n" $@ }

# convert hex color (808080) to rgb (128 128 128)
function hex2rgb() { echo $((16#${1:0:2})) $((16#${1:2:2})) $((16#${1:4:2})) }

# get dominant hex color from image
function dominant_color() {
    local infile=$1
    (( ! $+commands[magick] )) && { echo "ImageMagick must be installed"; return 1; }
    if [ -f $infile ]
    then
    local histogram=$(magick $infile -format %c \
        -define histogram:unique-colors=true -depth 8 histogram:info:)
    local color=($(echo $histogram | sort -n | tail -n 1))
    echo ${color[3]:gs/#/}
    fi
}

# Plugins
#
# LS_COLORS
# https://github.com/trapd00r/LS_COLORS
eval $(dircolors ~/.dircolors)

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
export YSU_MESSAGE_FORMAT="$(tput bold)$(tput setaf 7) $(tput sgr0)\
Found $(tput bold)$(tput setaf 3)%alias_type$(tput sgr0) for \
$(tput bold)$(tput setaf 6)%command$(tput sgr0), \
use: $(tput smul)$(tput setaf 2)%alias$(tput sgr0)"

# autoswitch_virtualenv
export AUTOSWITCH_MESSAGE_FORMAT="$(tput bold)$(tput setaf 7) $(tput sgr0)\
Activating $(tput bold)$(tput setaf 3)%venv_type$(tput sgr0): \
$(tput bold)$(tput setaf 6)%venv_name$(tput sgr0) \
$(tput bold)$(tput setaf 2) %py_version$(tput sgr0)"

# vim: set ft=zsh ts=2 sw=0 et:
