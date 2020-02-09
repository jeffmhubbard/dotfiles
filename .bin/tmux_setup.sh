#!/usr/bin/env bash

# extras/tmux_setup.sh
# install tpm

echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm.git "$HOME"/.config/tmux/plugins/tpm

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
