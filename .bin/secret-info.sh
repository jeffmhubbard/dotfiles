#!/usr/bin/env bash

# secret-info.sh
# no-more-secrets system info script

# decrypted text color
# white, yellow, black, magenta, blue, green, or red (or cyan?)
color="cyan"

# check for commands
# nms - no-more-secrets(-git)
# distro - python-distro
# pacman - i use arch btw
for cmd in nms distro pacman; do
  command -v "${cmd}" >/dev/null 2>&1 || \
    { echo >&2 "Unable to locate '${cmd}'!"; exit 1; }
done

# collect sys info
login="$USER"
host="$(uname -n)"
os="$(distro | grep Name | cut -d ' ' -f 2-)"
kernel="$(uname -sr)"
cpu="$(awk -F ':' '/model name/ {printf $2; exit}' "/proc/cpuinfo")"
gpu="$(lspci -mm | \
    awk -F '\\"|\\" \\"|\\(' \
    '/"Display|"3D|"VGA/ {a[$0] = $3 " " $4} END{for(i in a){if(!seen[a[i]]++) print a[i]}}' 2>/dev/null | \
    cut -d "[" -f2 | cut -d "]" -f1)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
wm="$(xprop -root | \
    grep '_NET_WM_NAME(UTF8_STRING)' | \
    awk '{print $3}' | \
    sed -e 's/^"//' -e 's/"$//')"
term="$(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))")"
shell="$(basename "${SHELL}")"

# disable unicode
LC_ALL=C
LANG=C

# display sys info
#clear && \
clear
echo "
 :LOGIN      ${login}
 :HOSTNAME   ${host}
 :OS         ${os}
 :KERNEL     ${kernel}
 :CPU       ${cpu}
 :GPU        ${gpu}
 :UPTIME     ${uptime}
 :PACKAGES   ${packages}
 :WM         ${wm}
 :TERM       ${term}
 :SHELL      ${shell}
" | nms -af "${color}"

# vim: ft=sh ts=2 sw=2 et:
