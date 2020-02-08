#!/usr/bin/env bash

# arch-updates.sh
# Check for Arch repo and AUR updates

# polybar config
#
# [module/updates]
# type = custom/script
# exec = $PBSCRIPTS/arch-updates.sh
# interval = 120
# format-prefix = "ﮮ "
# label = %output%
#

# leave this empty
counts=""

# check for repo updates
if repo=$(checkupdates 2>/dev/null | wc -l ); then
  counts+="$repo"
fi

# add separator
counts+="%{F#818383}+%{F-}"

# check for AUR updates
if aur=$(pacman -Q | aur vercmp 2>/dev/null | wc -l); then
  counts+="$aur"
fi

# display string if ANY updates
if [ "$repo" -gt 0 ] || [ "$aur" -gt 0 ]; then
  echo "$counts"
else
  echo ""
fi

# vim: ft=sh ts=2 sw=0 et:
