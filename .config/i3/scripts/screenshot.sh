#!/usr/bin/env bash

# screenshot with maim and dunst

SCREEN_DIR="${HOME}/Screenshots"
CACHE_DIR="${HOME}/.cache"
FILENAME="${SCREEN_DIR}/scr-$(date '+%Y-%m-%d_%H-%M-%S').png"
THUMBNAIL="${CACHE_DIR}/scr-thumb.png"

# check for commands
for cmd in maim dunstify magick; do
  command -v "${cmd}" >/dev/null 2>&1 || \
    { echo >&2 "Unable to locate '${cmd}'!"; exit 1; }
done

# check paths
for dir in ${SCREEN_DIR} ${CACHE_DIR}; do
  [[ -w ${dir} ]] || \
    { echo >&2 "Unable to write to '${dir}'!"; exit 1; }
done

# check for argument
declare SEL
if [[ "$1" == "-s" ]]; then
    SEL="--select"
fi

# call maim
if maim ${SEL} "${FILENAME}"; then

  # get resolution
  RES="$(magick identify "${FILENAME}" | cut -d' ' -f1)"

  # make thumbnail
  magick convert \
    -define "$FORMAT":size="${RES}" "${FILENAME}" \
    -thumbnail 64x64^ \
    -gravity center \
    -extent 64x64 \
    "${THUMBNAIL}"

  # show notification
  dunstify -u low -i "${THUMBNAIL}" "Screenshot captured" "${FILENAME}"
  
  # remove thumbnail
  [[ -f ${THUMBNAIL} ]] && \
    rm "${THUMBNAIL}"
fi 

# vim: ft=sh ts=2 sw=0 et:
