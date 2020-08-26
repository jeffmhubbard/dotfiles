#!/usr/bin/env bash

# Display notification for software updates

declare -i INTERVAL=600
declare REPO_CUR AUR_CUR
declare -i REPO_LAST AUR_LAST

# prevent multiple instances from running
clean_run() {

  pid="$$"
  pidfile="/var/run/user/$UID/check-updates.pid"

  if [ -f "$pidfile" ]; then
    oldpid=$(head -n 1 $pidfile)

    if [ ! "$pid" == "$oldpid" ]; then
      kill -9 "$oldpid" 2>/dev/null
    fi
  fi

  echo "$pid" > "$pidfile"

}

main() {

  clean_run

  while true
  do
    # get current counts
    REPO_CUR=$(checkupdates 2>/dev/null | wc -l )
    AUR_CUR=$(pacman -Q | aur vercmp 2>/dev/null | wc -l)

    # if counts are different from last, show notification
    if [[ "$REPO_CUR" -ne "$REPO_LAST" ]] || [[ "$AUR_CUR" -ne "$AUR_LAST" ]]; then
      if [[ "$REPO_CUR" -gt 0 ]] || [[ "$AUR_CUR" -gt 0 ]]; then
        TITLE="Software Updates Avaiable"
        BODY="pacman: $REPO_CUR\nAUR: $AUR_CUR"
        dunstify -a updates -u low "$TITLE" "$BODY"
      fi
    fi

    # update last counts
    REPO_LAST=$REPO_CUR
    AUR_LAST=$AUR_CUR

    # wait
    sleep $INTERVAL
  done
}

main

exit 0

# vim: ft=sh ts=2 sw=0 et:
