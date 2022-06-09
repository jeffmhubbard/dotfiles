# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jeff/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="antsy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    archlinux
    systemd
    command-not-found
    gpg-agent
    vi-mode
    z
    fz
    fzf
    fd
    pass
    git
    tmux
    autopair
    auto-notify
    you-should-use
    forgit
    virtualenv
    autoswitch_virtualenv
    fast-syntax-highlighting
    zsh-completions
    zsh-autosuggestions
    zsh-history-substring-search
    history
) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# shell options
export REPORTTIME=3         # Report time statistics
setopt notify               # Report status of bg jobs immediately
setopt no_hup               # Don't kill background jobs when exiting
setopt no_clobber           # Don't clobber existing files with >
setopt no_beep              # Don't beep
setopt no_bg_nice           # Don't frob with nicelevels
setopt interactive_comments # Allow comments in interactive shells
setopt autoremoveslash      # Don't guess when slashes should be removed (too magic)
setopt no_match             # Show error if globbing fails
setopt extended_glob        # More globbing characters
setopt correct              # Offer to correct command if not found
setopt auto_cd              # Change directory without `cd`
setopt multios              # Perform implicit tees or cats for multiple redirections

# history options
[ -z "$HISTFILE" ] && HISTFILE="$ZDOTCACHE/history.db"
export HISTSIZE=10000
export SAVEHIST=10000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_reduce_blanks     # remove superfluous blanks from commands added to history
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt append_history         # append to history
setopt hist_find_no_dups      # don't show dups in history search

# basics
export PAGER=less
export VISUAL=nvim
export EDITOR="$VISUAL"
export DIFFPROG="nvim -d $1"
export LESS='-RFW'

# vi-mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# configure external tools
# fzf 
if (( ${+commands[fzf]} ))
then
  export FZF_BASE=/usr/bin/fzf
  (( ${+commands[fd]} )) && \
    export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="
    --ansi
    --height 40%
    --color=16
    --color=fg:-1,bg:-1,hl:11
    --color=fg+:15,bg+:-1,hl+:14
    --color=info:13,prompt:15,spinner:10
    --color=pointer:14,marker:9,header:8
    --color=border:8
    --border sharp
  "
fi

# configure plugins
# z
export _Z_DATA=${ZSH_CUSTOM}/z.db

# forgit
export FORGIT_FZF_DEFAULT_OPTS="
  --ansi
  --height 100%
  --color=dark
  --color=fg:-1,bg:-1,hl:11
  --color=fg+:15,bg+:-1,hl+:14
  --color=info:13,prompt:15,spinner:10
  --color=pointer:14,marker:9,header:8
  --preview-window noborder
  --reverse
  --cycle
  --exact
"

# zsh-autosuggestions
bindkey '^[ ' autosuggest-accept    # Alt+Space
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh-history-substring-search
#export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=yellow,bold,underline"
#export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=red,bold,underline"

bindkey -M viins '^[[1;2A' history-substring-search-up      # Shift+Up
bindkey -M viins '^[[1;2B' history-substring-search-down    # Shift+Down
bindkey -M vicmd 'K' history-substring-search-up            # Shift+k
bindkey -M vicmd 'J' history-substring-search-down          # Shift+j

# auto-notify
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

# color man pages
function _termcap_custom_colors() {
  command env \
    LESS_TERMCAP_mb=$(printf "\e[1;34m") \
    LESS_TERMCAP_md=$(printf "\e[1;35m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[0;107;30m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;4;32m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    "$@"
}

function man() {
  _termcap_custom_colors man "$@"
}

# common
alias _='sudo '

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias md='mkdir -p'
alias rd=rmdir

alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias grep="grep -s --color=auto"
alias egrep="egrep -s --color=auto"
alias fgrep="fgrep -s --color=auto"

alias cat="bat -pp"
alias less=bat

alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'

alias ip="ip -c"

alias fp='pgrep -ax '

alias psc="ps -eo pid,cmd,%cpu --sort=-%cpu | head -11"
alias psm="ps -eo pid,cmd,%mem --sort=-%mem | head -11"

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# tmux
function _tmux_here {
  local here=${${${PWD:t}##[^a-zA-Z0-9]}//[^a-zA-Z0-9]/-}
  eval "tmux new-session -s $here"
}
alias th=_tmux_here

# aurutils
alias auq='aur search '
alias auqm='aur search --maintainer '
alias auqn='aur search --name '
alias auqd='aur search --desc '
alias aub='aur build -rf '
alias aubc='aur build -crf '
alias aus='aur sync $(pacman -Q | aur vercmp -q)'

# dotfiles git alias
alias dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# update plugins
alias update_vim_plugins="cd ~/.vim/bundle && find . -name .git -type d -execdir git pull ';'"
alias update_nvim_plugins="cd ~/.config/nvim/bundle && find . -name .git -type d -execdir git pull ';'"
alias update_zsh_plugins="cd ${ZSH_CUSTOM}/plugins && find . -name .git -type d -execdir git pull ';'"

# wttr
alias weather="curl -s 'wttr.in/aus?0'"
alias forecast="curl -s 'wttr.in/aus'"

# arch stuff
alias pacbrowse="pacman -Qq | \
    fzf \
        --preview 'pacman -Qil {}' \
        --layout=reverse \
        --height=100% \
        --bind 'enter:execute(pacman -Qil {} | less)'"

alias pacfast="sudo \
    reflector \
        --country US \
        --age 12 \
        --protocol https \
        --sort rate \
        --save /etc/pacman.d/mirrorlist \
        --verbose"

alias vim=nvim


ANTSY_GIT_SHA_ICON="|"
ANTSY_HISTORY_ICON=" "
#ANTSY_MARKER_ICON="─" # U+2500

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
