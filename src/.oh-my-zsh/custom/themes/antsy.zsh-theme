# antsy 2018

setopt prompt_subst

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
    local preprompt_left="%B%F{green}%n@%m %B%F{blue}%47<...<%~%<<%f%b"
    local preprompt_right="%B%F{red}$(git_prompt_info)%B%F{red}$(git_prompt_status) %f%b"
    local preprompt_left_length=${#${(S%%)preprompt_left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
    print -Pr "$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}
PROMPT='%B%F{cyan}$(virtualenv_prompt_info)%F{white}▶ %#%f%b '
RPROMPT="%B%F{red}%(?..%? ↵) %B%F{yellow}%D{%H:%M:%S}%f%b"

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export GREP_COLOR='1;33'
export LS_COLORS
