#!/usr/bin/env bash

icon="$HOME/Pictures/lock-icon-light.png"
tmpbg='/tmp/screen.png'

scrot -o "$tmpbg"


PARAM=(--inside-color=ffffff00 --ring-color=d4be983e \
       --time-color="#d4be9890" \
       --date-color="#d4be9890" \
       --clock \
       --time-str="%H:%M:%S"  \
       --date-str="%A, %m %Y" \
       --line-color=ffffff00 --keyhl-color=a8998480 --ringver-color=00000000 \
       --separator-color=d4be983e --insidever-color=a899841c \
       --ringwrong-color=cc241d55 --insidewrong-color=a899841c)

magick "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

magick "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

i3lock "${PARAM[@]}" -i "$tmpbg"

