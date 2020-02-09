#!/usr/bin/env bash

# deploy

echo "Deploying dotfiles..."

dotgit="$HOME/.dotfiles"
repo="git@code.linuxit.us:dotfiles"
temp="/tmp/dotfiles"

[[ -z $(command -v git 2>/dev/null) ]] && \
    { echo "ERROR: git not installed!"; exit 1; }

[[ -z $(command -v rsync 2>/dev/null) ]] && \
    { echo "ERROR: rsync not installed!"; exit 1; }

[[ -d "$dotgit" ]] && \
    { echo "ERROR: '$dotgit' exists!"; exit 1; }

if ! git clone --separate-git-dir="$dotgit" "$repo" "$temp"
then
    echo "ERROR: failed to clone!"; exit 1;
fi

if ! rsync --recursive --verbose --exclude '.git' "$temp/" "$HOME/"
then
    echo "ERROR: failed to install!"; exit 1;
fi

[[ -d "$temp" ]] && \
    { echo "Cleaing up!"; rm -r "$temp"; }

git --git-dir="$dotgit" --work-tree="$HOME" \
    config --local status.showUntrackedFiles no

echo "Done"
exit 0

# vim: ft=sh ts=2 sw=0 et:
