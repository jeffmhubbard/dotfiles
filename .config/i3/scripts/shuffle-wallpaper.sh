#!/usr/bin/env bash

# Wallpaper shuffler with feh

# default config
wall_path="$HOME/Wallpapers" # wallpaper directory
sleep_time=10                # interval in minutes
bg_mode=fill                 # background mode
span_bool=false              # span multiple displays

# prevent multiple instances from running
clean_run() {

  pid="$$"
  pidfile="/var/run/user/$UID/$(basename "$0").pid"

  if [ -f "$pidfile" ]; then
    oldpid=$(head -n 1 "$pidfile")

    if [ ! "$pid" == "$oldpid" ]; then
      kill -9 "$oldpid" 2>/dev/null
    fi
  fi

  echo "$pid" > "$pidfile"

}

# write list of supported images to temp file
get_image_list() {

  local path=$1
  local list=$2

  find "$path" -regextype posix-extended -regex '.*\.(jpg|jpeg|png)' > "$list"

  if [ "$(wc -l < "$list")" -lt 1 ]; then
    printf "ERROR: '%s' does not contain any supported images! (JPG, PNG)\n" "$path"
    exit 1
  fi

}

# set wallpaper
set_wallpaper() {

  local wall_list
  wall_list=$(mktemp /tmp/"$(basename "$0")".XXXXXX)

  # get image list
  get_image_list "$wall_path" "$wall_list"

  # call feh, trap errors
  local output
  output=$(feh -zq $mode $span -f $wall_list 2>&1)

  # clean up temp file
  if [ -f "$wall_list" ]; then
    rm "$wall_list"
  fi

  # stop if feh errors
  if [ ! "$output" = "" ]; then
    echo "${output[@]}"
    return 1
  fi

}

main() {

  # there can be only one
  clean_run

  # get background mode
  case "$bg_mode" in
    center) mode="--bg-center";;
    fill) mode="--bg-fill";;
    max) mode="--bg-max";;
    scale) mode="--bg-scale";;
    tile) mode="--bg-tile";;
  esac

  # span displays?
  span=""
  if $span_bool; then
    span="--no-xinerama"
  fi

  # loop
  while true; do

    if set_wallpaper; then
      # if interval is 0, run once and exit
      if [ "$sleep_time" -eq 0 ]; then
        break
      fi
      sleep $((sleep_time*60))

    else
      exit 1
    fi

  done

}

# process command line arguments
while getopts d:t:b:sD ARGS; do
  case "${ARGS}" in
    d) wall_path="${OPTARG}";;
    t) sleep_time="${OPTARG}";;
    b) bg_mode="${OPTARG}";;
    s) span_bool=true;;
    *) echo "unknown option"; exit 1;;
  esac
done
shift $((OPTIND-1))

main

exit 0

# vim: ft=sh ts=2 sw=0 et:
