# Moved from .zshrc

# General
#
# bat
# https://github.com/sharkdp/bat
(( $+commands[bat] )) && alias cat="bat"

# ip color output
(( $+commands[ip] )) && alias ip="ip -c"

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

