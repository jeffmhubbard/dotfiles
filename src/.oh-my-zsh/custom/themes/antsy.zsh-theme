# antsy.zsh-theme

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
    local preprompt_left="%B%F{green}$admin%n%F{green}@%m %B%F{blue}%47<...<%~%<<%f%b"
    local preprompt_right="%B%F{red}$(git_prompt_info)%B%F{red}$(git_prompt_status)%f%b"
    local preprompt_left_length=${#${(S%%)preprompt_left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
    print -Pr "$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}

PROMPT='%B%F{cyan}$(virtualenv_prompt_info)%F{white}➜ %F{white}%#%f%b '
RPROMPT="%B%F{red}%(?..%? ↵) %B%F{yellow}%D{%H:%M:%S}%f%b"

# colored-man-pages (antsy)
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;34m") \
		LESS_TERMCAP_md=$(printf "\e[1;35m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[0;107;30m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;4;32m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
			man "$@"
}

# vim: set ft=zsh:
