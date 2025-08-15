#!/bin/sh

hellwal -i Pictures/Wallpapers/ --random   

source ~/.cache/hellwal/variables.sh

# Rofi
cp ~/.cache/hellwal/rofi.rasi ~/.config/rofi/config.rasi

# Firefox
cp ~/.cache/hellwal/pywalfox.json ~/.cache/wal/colors.json
pywalfox update

# restart Firefox
awesome-client 'awesome.restart()'

