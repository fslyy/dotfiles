#!/usr/bin/env bash

tmpbg='/tmp/screen.png'

source ~/.cache/hellwal/variables.sh

scrot -o "$tmpbg"


PARAM=(--inside-color=ffffff00 --ring-color=$color0 \
       --time-color=$color3 \
       --date-color=$color3 \
       --clock \
       --time-str="%H:%M:%S"  \
       --date-str="%A, %m %Y" \
       --verif-color=$color3 --wrong-color=$color3 \
       --line-color=00000000 --keyhl-color=$color2 --ringver-color=$color2 \
       --separator-color=$color0 --insidever-color=00000000 \
       --ringwrong-color=$color8 --insidewrong-color=00000000)

magick "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

magick "$tmpbg" -gravity center -composite "$tmpbg"

i3lock "${PARAM[@]}" -i "$tmpbg"

