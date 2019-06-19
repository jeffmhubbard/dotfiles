#
# ~/.bash_profile
#
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/Env

export PAGER=less
export EDITOR=vim
export DIFFPROG=vimdiff

export TERMINAL=urxvtc
export BROWSER=/usr/bin/qutebrowser

[[ -f ~/.bashrc ]] && . ~/.bashrc
