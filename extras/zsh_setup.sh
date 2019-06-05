#!/usr/bin/env bash

# extras/zsh_setup.sh

#
# install oh-my-zsh and fast-syntax-highlighting
#

# check for zsh
if ! type "zsh" > /dev/null; then
    echo "Zsh is not installed!"
cat << EOF
Try:
    Arch: pacman -S zsh
    Void: xbps-install -S zsh
    Debian: apt install zsh
EOF
    exit 0
fi

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zdharma/fast-syntax-highlighting.git "$HOME"/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

echo "Done"

# vim: set ft=sh:
