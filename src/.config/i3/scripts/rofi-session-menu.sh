#!/usr/bin/env bash

# use rofi to create a simple session menu

MENU_TITLE="  Arch Linux "
declare -A OPTIONS
OPTIONS=(
  [" Lock Desktop"]="awful --lock"
  [" Display Settings"]="$I3SCRIPTS/rofi-randr.zsh"
  [" Layout Manager"]="$I3SCRIPTS/layout-manager.sh"
  [" Reload Config"]="i3-msg reload"
  [" Restart Desktop"]="i3-msg restart"
  [" Exit Desktop"]="i3-msg exit"
)

get_options() {
    for choice in "${!OPTIONS[@]}"
    do
      echo "$choice"
    done
}

#    
main() {
  choice=$( (get_options) | rofi -dmenu -i -p "$MENU_TITLE" )
  if [[ -n "$choice" ]]; then
    exec ${OPTIONS[$choice]}
  fi
}

main

exit 0


# vim: set ft=sh:
