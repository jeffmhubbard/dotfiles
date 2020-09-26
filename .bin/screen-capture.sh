#!/usr/bin/env bash

# screenshot with maim and dunst

save_to="${HOME}/Screenshots"
cache_dir="${HOME}/.cache"
save_file="${save_to}/scr-$(date '+%Y-%m-%d_%H-%M-%S').png"
thumbnail="${cache_dir}/scr-thumb.png"

# check for commands
for cmd in maim dunstify magick; do
  command -v "${cmd}" >/dev/null 2>&1 || \
    { echo >&2 "Unable to locate '${cmd}'!"; exit 1; }
done

# check paths
for dir in ${save_to} ${cache_dir}; do
  [[ -w ${dir} ]] || \
    { echo >&2 "Unable to write to '${dir}'!"; exit 1; }
done

# check for argument
declare selection
if [[ "$1" == "-s" ]]; then
    selection="--select"
fi

# call maim
if maim ${selection} "${save_file}"; then

  # get resolution
  resolution="$(magick identify "${save_file}" | cut -d ' ' -f 1)"

  # make thumbnail
  magick convert \
    -define "$FORMAT":size="${resolution}" "${save_file}" \
    -thumbnail 64x64^ \
    -gravity center \
    -extent 64x64 \
    "${thumbnail}"

  # show notification
  dunstify -u low -i "${thumbnail}" "Screenshot captured" "${save_file}"
  
  # remove thumbnail
  [[ -f ${thumbnail} ]] && \
    rm "${thumbnail}"
fi 

# vim: ft=sh ts=2 sw=0 et:
