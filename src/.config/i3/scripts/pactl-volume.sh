#!/usr/bin/env bash

# pactl-volume.sh - raise and lower volume with pactl
# export PACTLSINK with appropriate device

DEVICE="$PACTLSINK"
[[ -n "$DEVICE" ]] || exit 1

volume_up() {
  pactl set-sink-volume "$DEVICE" +"$1"%
}

volume_down() {
  pactl set-sink-volume "$DEVICE" -"$1"%
}

while getopts u:d: ARGS; do
  case "${ARGS}" in
    u) volume_up "${OPTARG}";;
    d) volume_down "${OPTARG}";;
    *) exit 1;;
  esac
done
shift $((OPTIND-1))

# vim: ft=sh ts=2 sw=0 et:
