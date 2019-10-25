#!/usr/bin/env bash

# extras/tmux_setup.sh

#
# install tpm and plugins
#

PLUGIN_DIR="$HOME/.tmux/plugins"

declare -a PLUGINS
PLUGINS=(
  https://github.com/tmux-plugins/tmux-resurrect.git
)

echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm.git "$HOME"/.config/tmux/plugins/tpm

# install plugins
echo "Installing plugins..."
for url in "${PLUGINS[@]}"
do
  repo=$(basename "$url" ".${url##*.}")
  git clone "${url}" "${PLUGIN_DIR}"/"${repo}"
done

echo "Done"

# vim: set ft=bash ts=2 sw=0 et:
