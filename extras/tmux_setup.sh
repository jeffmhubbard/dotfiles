#!/usr/bin/env bash

# extras/tmux_setup.sh

#
# install tpm and tmux-resurrect
#

PLUGIN_DIR="$HOME/.tmux/plugins"

declare -a PLUGINS
PLUGINS=(
    https://github.com/tmux-plugins/tmux-resurrect.git
)

# check for tmux
if ! type "tmux" > /dev/null; then
    echo "tmux is not installed!"
cat << EOF
Try:
    Arch: pacman -S tmux
    Void: xbps-install -S tmux
    Debian: apt install tmux
EOF
    exit 0
fi

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

# vim: set ft=sh:
