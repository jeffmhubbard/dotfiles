#!/usr/bin/env bash

#
# arch-updates.sh
#
# Check for Arch repo and AUR updates
#

REPO_CMD="checkupdates"
AUR_CMD="auracle sync -q"

DISPLAY_TEXT=""
SEPARATOR="%{F#818383}+%{F-}"

# check for repo updates
if repo=$($REPO_CMD 2>/dev/null | wc -l ); then
    DISPLAY_TEXT+="$repo"
fi

DISPLAY_TEXT+="$SEPARATOR"

# check for AUR updates
if aur=$($AUR_CMD 2>/dev/null | wc -l); then
    DISPLAY_TEXT+="$aur"
fi

# display string if ANY updates
if [ "$repo" -gt 0 ] || [ "$aur" -gt 0 ]; then
    echo "$DISPLAY_TEXT"
else
    echo ""
fi

