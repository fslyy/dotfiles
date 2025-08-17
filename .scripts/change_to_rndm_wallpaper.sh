#!/bin/sh

hellwal -i Pictures/Wallpapers/ --random 

# first, restart awesome to apply theme
awesome-client 'awesome.restart()'

# then do the rest
source ~/.cache/hellwal/variables.sh

# set wallpaper
feh --bg-fill "$wallpaper" 

# Rofi
cp ~/.cache/hellwal/rofi.rasi ~/.config/rofi/config.rasi

# Firefox
cp ~/.cache/hellwal/pywalfox.json ~/.cache/wal/colors.json
pywalfox update

#kitty and vim automatically take colorcscheme (vim needs to relaunch)


