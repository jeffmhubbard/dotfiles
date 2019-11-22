#!/usr/bin/env bash

#
# rofi_session_menu.sh
#
# use rofi to create a simple session menu
#

#  
MENU_TITLE="  Arch Linux "

declare -A OPTIONS
OPTIONS=(
    # - menuitem -------- command
    [" Lock Desktop"]="awful --lock"
    [" Display Settings"]="$I3SCRIPTS/rofi-randr.zsh"
    [" Layout Manager"]="$I3SCRIPTS/layout-manager.sh"
    [" Reload Config"]="i3-msg reload"
    [" Restart Desktop"]="i3-msg restart"
    [" Exit Desktop"]="i3-msg exit"
)

get_menuitems() {
    for item in "${!OPTIONS[@]}"; do
        echo "$item"
    done
}

menu() {
    choice=$( (get_menuitems) | rofi -dmenu -i -p "$MENU_TITLE")
    if [[ -n "$choice" ]]; then
        # shellcheck disable=SC2086
        exec ${OPTIONS[$choice]}
    fi
}
menu

exit 0

# vim: set ft=sh:
