#!/usr/bin/env bash

# extras/tmux_setup.sh

#
# install tpm and tmux-resurrect
#

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

echo "Installing tmux-resurrect..."
git clone https://github.com/tmux-plugins/tmux-resurrect.git "$HOME"/.config/tmux/plugins/tmux-resurrect

echo "Done"

# vim: set ft=sh:
