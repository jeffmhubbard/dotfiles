##  File: antsy.zsh-theme
##  Maintainer: https://github.com/jeffmhubbard/dotfiles/
##  License: The MIT License (MIT)
##  Modified: June 21, 2018

setopt prompt_subst

if [[ ! $TERM == 'linux' ]]; then
    ZLE_RPROMPT_INDENT=0
fi

ZSH_THEME_GIT_PROMPT_PREFIX='±'
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY=''
ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_ADDED=' ✚'
ZSH_THEME_GIT_PROMPT_MODIFIED=' ●'
ZSH_THEME_GIT_PROMPT_DELETED=' ✖'
ZSH_THEME_GIT_PROMPT_RENAMED=' ➤'
ZSH_THEME_GIT_PROMPT_UNMERGED=' ♦'
ZSH_THEME_GIT_PROMPT_UNTRACKED=' ✱'
ZSH_THEME_GIT_PROMPT_AHEAD=' ▲'

ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=")"

precmd(){
    if [ $UID -eq 0 ]; then
        admin="%F{red}!"
    fi
    local preprompt_left="%B%F{green}$admin%n@%m %B%F{blue}%47<...<%~%<<%f%b"
    local preprompt_right="%B%F{red}$(git_prompt_info)%B%F{red}$(git_prompt_status)%f%b"
    local preprompt_left_length=${#${(S%%)preprompt_left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
    print -Pr "$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}

PROMPT='%B%F{cyan}$(virtualenv_prompt_info)%F{white}▶ %#%f%b '
RPROMPT="%B%F{red}%(?..%? ↵) %B%F{yellow}%D{%H:%M:%S}%f%b"

# colored-man-pages (antsy)
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[01;38;5;11m") \
		LESS_TERMCAP_md=$(printf "\e[01;38;5;9m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[0;48;5;12;38;5;11m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[01;38;5;10m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}

# vim: set ft=zsh:
