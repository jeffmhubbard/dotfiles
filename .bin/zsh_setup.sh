#!/usr/bin/env bash

# extras/zsh_setup.sh
# install oh-my-zsh and plugins

PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"

declare -a PLUGINS
PLUGINS=(
  https://github.com/zdharma/fast-syntax-highlighting.git
  https://github.com/zsh-users/zsh-autosuggestions.git
  https://github.com/MichaelAquilina/zsh-auto-notify.git
  https://github.com/wfxr/forgit.git
)

# install oh-my-zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plugins
echo "Installing plugins..."
for url in "${PLUGINS[@]}"
do
  repo=$(basename "$url" ".${url##*.}")
  git clone "${url}" "${PLUGIN_DIR}"/"${repo}"
done

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
