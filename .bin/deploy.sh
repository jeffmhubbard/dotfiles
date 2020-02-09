#!/usr/bin/env bash

# quick and dirty script to install dotfiles on new host

dotgit="$HOME/.dotfiles"
repo="git@code.linuxit.us:dotfiles"
temp="/tmp/dotfiles"

[[ -z $(command -v git 2>/dev/null) ]] && ( echo "git not installed!"; exit 1 )
[[ -z $(command -v rsync 2>/dev/null) ]] && ( echo "rsync not installed!"; exit 1 )
[[ -d "$dotgit" ]] && ( echo "ERROR: '$dotgit' exists!"; exit 1 )

git clone --separate-git-dir="$dotgit" "$repo" "$temp"
rsync --recursive --verbose --exclude '.git' "$temp/" "$HOME/"
rm -r "$temp"

git --git-dir="$dotgit" --work-tree="$HOME" \
    config --local status.showUntrackedFiles no
