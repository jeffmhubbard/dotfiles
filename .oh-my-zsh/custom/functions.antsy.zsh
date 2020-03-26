# Moved from .zshrc

# Functions
#
# calculate distance between two hex colors
# using Euclidean formula
# https://en.wikipedia.org/wiki/Color_difference
function color_dist() {
    local color1=($(hex2rgb $1))
    local color2=($(hex2rgb $2))
    local red=$(echo "var=$color1[1]-$color2[1];var*var" | bc)
    local green=$(echo "var=$color1[2]-$color2[2];var*var" | bc)
    local blue=$(echo "var=$color1[3]-$color2[3];var*var" | bc)
    echo "sqrt ( $red + $green + $blue )" | bc
}

# convert rgb color (128 128 128) to hex (808080)
function rgb2hex() { printf "%02x%02x%02x\n" $@ }

# convert hex color (808080) to rgb (128 128 128)
function hex2rgb() { echo $((16#${1:0:2})) $((16#${1:2:2})) $((16#${1:4:2})) }

# get dominant hex color from image
function dominant_color() {
  local infile=$1
  (( ! $+commands[magick] )) && { echo "ImageMagick must be installed"; return 1; }
  if [ -f $infile ]
  then
    local histogram=$(magick $infile -format %c \
      -define histogram:unique-colors=true -depth 8 histogram:info:)
    local color=($(echo $histogram | sort -n | tail -n 1))
    echo ${color[3]:gs/#/}
  fi
}

