#!/usr/bin/env bash

# install tpm

TPM_URL="https://github.com/tmux-plugins/tpm.git"
PLUGIN_DIR="$HOME/.config/tmux/plugins"

# create directories
echo "Creating directories..."
if ! mkdir -p "${PLUGIN_DIR}"; then
  echo "Failed to create $PLUGIN_DIR!"; exit 1
fi

echo "Installing TPM..."
if ! git clone "${TPM_URL}" "${PLUGIN_DIR}/tpm"; then
  echo "Failed to install TPM!"; exit 1
fi

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
