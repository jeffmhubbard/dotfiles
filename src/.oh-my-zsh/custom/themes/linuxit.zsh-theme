# LinuxIt Zsh Prompt
# Jeff M. Hubbard, 2018

function setprompt () {

  setopt prompt_subst

  ZLE_RPROMPT_INDENT=0

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


  local left right invisible rightcontent leftcontent

  left='%B%F{green}%n@%m '
  left+='%B%F{blue}%~'
  left+=$'%f%b'

  lprompt='%B%F{cyan}$(virtualenv_prompt_info)'
  lprompt+='%B%F{white}▶ %#'
  lprompt+=$'%f%b'

  lprompt2+='%B%F{white}▶ %_'
  lprompt2+=$'%f%b'

  right='%B%F{red}$(git_prompt_info)'
  right+='%B%F{red}$(git_prompt_status)'
  right+=$'%f%b'

  rprompt='%B%F{red}%(?..%? ↵) '
  rprompt+='%B%F{yellow}%D{%H:%M:%S}'
  rprompt+=$'%f%b'

  invisible='%([BSUbfksu]|([FBK]|){*})'
  leftcontent=${(S)left//$~invisible}
  rightcontent=${(S)right//$~invisible}

  PS1="$left\${(l,COLUMNS-\${#\${(%):-$leftcontent$rightcontent}},)}$right\
$lprompt "
  PS2='$lprompt2'
  RPROMPT='$rprompt'
}

setprompt

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export GREP_COLOR='1;33'
export LS_COLORS
