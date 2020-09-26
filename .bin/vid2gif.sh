#!/usr/bin/env zsh

length=$1
input=$2
output=$3

[[ -z $length ]] && { echo "not length?"; exit 1; }
[[ ! -f $input ]] && { echo "file not found"; exit 1; }
[[ ! -d $testfile:h ]] && { echo "output invalid"; exit 1; }

ffmpeg \
    -t $length \
    -i $input \
    -vf "fps=10,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    $output
