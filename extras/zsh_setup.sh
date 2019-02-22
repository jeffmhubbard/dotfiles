#!/usr/bin/env bash

# extras/zsh_setup.sh

[[ ! "command -v zsh" ]] && \
    echo "Please install zsh first" && \
    exit 0

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# vim: set ft=sh:
