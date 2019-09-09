#!/usr/bin/env bash

# extras/zsh_setup.sh

#
# install oh-my-zsh and plugins
#

PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"

declare -a PLUGINS
PLUGINS=(
    https://github.com/zdharma/fast-syntax-highlighting.git
    https://github.com/zsh-users/zsh-autosuggestions.git
)

# check for zsh
if ! type "zsh" > /dev/null; then
    echo "Zsh is not installed!"
    exit 0
fi

# install pathogen
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install plugins
echo "Installing plugins..."
for url in "${PLUGINS[@]}"
do
    repo=$(basename "$url" ".${url##*.}")
    git clone "${url}" "${PLUGIN_DIR}"/"${repo}"
done

echo "Done"

# vim: set ft=sh:
