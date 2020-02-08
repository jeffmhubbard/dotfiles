#!/usr/bin/env bash

# xsetroot-random-color.sh [MATCH] [--print]
#
# Set random color as root X window background using
# list of named X colors
#
# MATCH: String to match colors
# --print: Print all available colors


VER=$(basename "$0")

# Lots O' Screen Colors
# http://sub-atomic.com/~moses/decimalcol.html
declare -a COLORS
COLORS=( \
    Snow SlateBlue1 DarkOrange1 \
    GhostWhite SlateBlue2 DarkOrange2 \
    WhiteSmoke SlateBlue3 DarkOrange3 \
    Gainsboro SlateBlue4 DarkOrange4 \
    FloralWhite RoyalBlue1 Coral1 \
    OldLace RoyalBlue2 Coral2 \
    Linen RoyalBlue3 Coral3 \
    AntiqueWhite RoyalBlue4 Coral4 \
    PapayaWhip Blue1 Tomato1 \
    BlanchedAlmond Blue2 Tomato2 \
    Bisque Blue3 Tomato3 \
    PeachPuff Blue4 Tomato4 \
    NavajoWhite DodgerBlue1 OrangeRed1  \
    Moccasin DodgerBlue2 OrangeRed2  \
    Cornsilk DodgerBlue3 OrangeRed3  \
    Ivory DodgerBlue4 OrangeRed4 \
    LemonChiffon SteelBlue1 Red1 \
    Seashell SteelBlue2 Red2 \
    Honeydew SteelBlue3 Red3 \
    MintCream SteelBlue4 Red4 \
    Azure DeepSkyBlue1 DeepPink1 \
    AliceBlue DeepSkyBlue2 DeepPink2 \
    Lavender DeepSkyBlue3 DeepPink3 \
    LavenderBlush DeepSkyBlue4 DeepPink4 \
    MistyRose SkyBlue1 HotPink1 \
    White SkyBlue2 HotPink2 \
    Black SkyBlue3 HotPink3 \
    DarkSlateGray SkyBlue4 HotPink4 \
    DimGray LightSkyBlue1 Pink1 \
    SlateGray LightSkyBlue2 Pink2 \
    LightSlateGray LightSkyBlue3 Pink3 \
    Grey LightSkyBlue4 Pink4 \
    LightGrey SlateGray1 LightPink1 \
    MidnightBlue SlateGray2 LightPink2 \
    NavyBlue SlateGray3 LightPink3 \
    CornflowerBlue SlateGray4 LightPink4 \
    DarkSlateBlue LightSteelBlue1 PaleVioletRed1 \
    SlateBlue LightSteelBlue2 PaleVioletRed2 \
    MediumSlateBlue LightSteelBlue3 PaleVioletRed3 \
    LightSlateBlue LightSteelBlue4 PaleVioletRed4 \
    MediumBlue LightBlue1 Maroon1 \
    RoyalBlue LightBlue2 Maroon2 \
    Blue LightBlue3 Maroon3 \
    DodgerBlue LightBlue4 Maroon4 \
    DeepSkyBlue LightCyan1 VioletRed1 \
    SkyBlue LightCyan2 VioletRed2 \
    LightSkyBlue LightCyan3 VioletRed3 \
    SteelBlue LightCyan4 VioletRed4 \
    LightSteelBlue PaleTurquoise1 Magenta1 \
    LightBlue PaleTurquoise2 Magenta2 \
    PowderBlue PaleTurquoise3 Magenta3 \
    PaleTurquoise PaleTurquoise4 Magenta4 \
    DarkTurquoise CadetBlue1 Orchid1 \
    MediumTurquoise CadetBlue2 Orchid2 \
    Turquoise CadetBlue3 Orchid3 \
    Cyan CadetBlue4 Orchid4 \
    LightCyan Turquoise1 Plum1 \
    CadetBlue Turquoise2 Plum2 \
    MediumAquamarine Turquoise3 Plum3 \
    Aquamarine Turquoise4 Plum4 \
    DarkGreen Cyan1 MediumOrchid1 \
    DarkOliveGreen Cyan2 MediumOrchid2 \
    DarkSeaGreen Cyan3 MediumOrchid3 \
    SeaGreen Cyan4 MediumOrchid4 \
    MediumSeaGreen DarkSlateGray1 DarkOrchid1 \
    LightSeaGreen DarkSlateGray2 DarkOrchid2 \
    PaleGreen DarkSlateGray3 DarkOrchid3 \
    SpringGreen DarkSlateGray4 DarkOrchid4 \
    LawnGreen Aquamarine1 Purple1 \
    Green Aquamarine2 Purple2 \
    Chartreuse Aquamarine3 Purple3 \
    MediumSpringGreen Aquamarine4 Purple4 \
    GreenYellow DarkSeaGreen1 MediumPurple1 \
    LimeGreen DarkSeaGreen2 MediumPurple2 \
    YellowGreen DarkSeaGreen3 MediumPurple3 \
    ForestGreen DarkSeaGreen4 MediumPurple4 \
    OliveDrab SeaGreen1 Thistle1 \
    DarkKhaki SeaGreen2 Thistle2 \
    Khaki SeaGreen3 Thistle3 \
    PaleGoldenrod SeaGreen4 Thistle4 \
    LightGoldenrodYellow PaleGreen1 Grey0 \
    LightYellow PaleGreen2 Grey1 \
    Yellow PaleGreen3 Grey2 \
    Gold PaleGreen4 Grey3 \
    LightGoldenrod SpringGreen1 Grey4 \
    Goldenrod SpringGreen2 Grey5 \
    DarkGoldenrod SpringGreen3 Grey6 \
    RosyBrown SpringGreen4 Grey7 \
    IndianRed Green1 Grey8 \
    SaddleBrown Green2 Grey9 \
    Sienna Green3 Grey10 \
    Peru Green4 Grey11 \
    Burlywood Chartreuse1 Grey12 \
    Beige Chartreuse2 Grey13 \
    Wheat Chartreuse3 Grey14 \
    SandyBrown Chartreuse4 Grey15 \
    Tan OliveDrab1 Grey16 \
    Chocolate OliveDrab2 Grey17 \
    Firebrick OliveDrab3 Grey18 \
    Brown OliveDrab4 Grey19 \
    DarkSalmon DarkOliveGreen1 Grey20 \
    Salmon DarkOliveGreen2 Grey21 \
    LightSalmon DarkOliveGreen3 Grey22 \
    Orange DarkOliveGreen4 Grey23 \
    DarkOrange Khaki1 Grey24 \
    Coral Khaki2 Grey25 \
    LightCoral Khaki3 Grey26 \
    Tomato Khaki4 Grey27 \
    OrangeRed LightGoldenrod1 Grey28 \
    Red LightGoldenrod2 Grey29 \
    HotPink LightGoldenrod3 Grey30 \
    DeepPink LightGoldenrod4 Grey31 \
    Pink LightYellow1 Grey32 \
    LightPink LightYellow2 Grey33 \
    PaleVioletRed LightYellow3 Grey34 \
    Maroon LightYellow4 Grey35 \
    MediumVioletRed Yellow1 Grey36 \
    VioletRed Yellow2 Grey37 \
    Magenta Yellow3 Grey38 \
    Violet Yellow4 Grey39 \
    Plum Gold1 Grey40 \
    Orchid Gold2 Grey41 \
    MediumOrchid Gold3 Grey42 \
    DarkOrchid Gold4 Grey43 \
    DarkViolet Goldenrod1 Grey44 \
    BlueViolet Goldenrod2 Grey45 \
    Purple Goldenrod3 Grey46 \
    MediumPurple Goldenrod4 Grey47 \
    Thistle DarkGoldenrod1 Grey48 \
    Snow1 DarkGoldenrod2 Grey49 \
    Snow2 DarkGoldenrod3 Grey50 \
    Snow3 DarkGoldenrod4 Grey51 \
    Snow4 RosyBrown1 Grey52 \
    Seashell1 RosyBrown2 Grey53 \
    Seashell2 RosyBrown3 Grey54 \
    Seashell3 RosyBrown4 Grey55 \
    Seashell4 IndianRed1 Grey56 \
    AntiqueWhite1 IndianRed2 Grey57 \
    AntiqueWhite2 IndianRed3 Grey58 \
    AntiqueWhite3 IndianRed4 Grey59 \
    AntiqueWhite4 Sienna1 Grey60 \
    Bisque1 Sienna2 Grey61 \
    Bisque2 Sienna3 Grey62 \
    Bisque3 Sienna4 Grey63 \
    Bisque4 Burlywood1 Grey64 \
    PeachPuff1 Burlywood2 Grey65 \
    PeachPuff2 Burlywood3 Grey66 \
    PeachPuff3 Burlywood4 Grey67 \
    PeachPuff4 Wheat1 Grey68 \
    NavajoWhite1 Wheat2 Grey69 \
    NavajoWhite2 Wheat3 Grey70 \
    NavajoWhite3 Wheat4 Grey71 \
    NavajoWhite4 Tan1 Grey72 \
    LemonChiffon1 Tan2 Grey73 \
    LemonChiffon2 Tan3 Grey74 \
    LemonChiffon3 Tan4 Grey75 \
    LemonChiffon4 Chocolate1 Grey76 \
    Cornsilk1 Chocolate2 Grey77 \
    Cornsilk2 Chocolate3 Grey78 \
    Cornsilk3 Chocolate4 Grey79 \
    Cornsilk4 Firebrick1 Grey80 \
    Ivory1 Firebrick2 Grey81 \
    Ivory2 Firebrick3 Grey82 \
    Ivory3 Firebrick4 Grey83 \
    Ivory4 Brown1 Grey84 \
    Honeydew1 Brown2 Grey85 \
    Honeydew2 Brown3 Grey86 \
    Honeydew3 Brown4 Grey87 \
    Honeydew4 Salmon1 Grey88 \
    LavenderBlush1 Salmon2 Grey89 \
    LavenderBlush2 Salmon3 Grey90 \
    LavenderBlush3 Salmon4 Grey91 \
    LavenderBlush4 LightSalmon1 Grey92 \
    MistyRose1 LightSalmon2 Grey93 \
    MistyRose2 LightSalmon3 Grey94 \
    MistyRose3 LightSalmon4 Grey95 \
    MistyRose4 Orange1 Grey96 \
    Azure1 Orange2 Grey97 \
    Azure2 Orange3 Grey98 \
    Azure3 Orange4 Grey99 \
    Azure4 Grey100
)

MATCH=$1

# print list of colors and exit
if [[ $MATCH == "--print" ]]; then
    for color in "${COLORS[@]}"; do 
        printf "%-8s\n" "${color}"
    done | column
    exit
fi

# find colors containing MATCH string
if [[ -n "$MATCH" ]]; then
    printf "Matching: %s\n" "$MATCH"
    declare -a MATCHING
    for color in "${COLORS[@]}"; do
        if [[ "${color,,}" == *"${MATCH,,}"* ]]; then
            MATCHING+=("$color")
        fi
    done
    if [ ! ${#MATCHING[@]} -eq 0 ]; then
        unset COLORS
        COLORS=("${MATCHING[@]}")
    else
        echo "$VER: ERROR: No matching colors!"
        exit 1
    fi
fi

# get random color from array
RANDOM_SEED=$$$(date +%s)
ARRAY_SIZE=${#COLORS[@]}
RANDOM_NUMBER=$((RANDOM_SEED % ARRAY_SIZE))
RANDOM_COLOR=${COLORS[$RANDOM_NUMBER]}

# set root color
if [[ -n $(command -v xsetroot 2>/dev/null) ]]; then
    xsetroot -solid "$RANDOM_COLOR"
    printf "Set root window color to: %s\n" "$RANDOM_COLOR"
else
    echo "$VER ERROR: Could not locate xsetroot!"
    exit 1
fi

# vim: ft=sh:
