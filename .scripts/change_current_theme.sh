#!/bin/sh

if [ -z "$1" ]; # if no specific theme provided -> generate theme from random wallpaper and display
then

  hellwal -i Pictures/Wallpapers/ --random

  source ~/.cache/hellwal/variables.sh 
  feh --bg-fill "$wallpaper" 

else # display selected theme and choose a fitting wallpaper for it

  hellwal --theme $1 #theme path for hellwal (ex: gruvbox.hellwal)

  theme=${1%.*} #slice var until .
  
  # set wallpaper
  feh --bg-fill "$(find ~/Pictures/Wallpapers/ -type f -name "${theme}*" | shuf -n 1)"  

fi
# ------------ APPLY THEME -----------

# first, restart awesome to apply theme
awesome-client 'awesome.restart()'  

# Firefox                                                                                     
cp ~/.cache/hellwal/pywalfox.json ~/.cache/wal/colors.json                                    
pywalfox update

# code OSS
cp ~/.cache/hellwal/vs-wal-colortheme.json ~/.vscode-oss/extensions/me.vs-wal-0.0.1/themes/vs-wal-colortheme.json

# Obsidian
cp ~/.cache/hellwal/obsidian-theme.css ~/Uni/.obsidian/themes/Hellwal/theme.css

# qt5
cp ~/.cache/hellwal/qt-colors.conf ~/.config/qt5ct/colors/qt-colors.conf

#gtk-3.0
cp ~/.cache/hellwal/gtk.css ~/.themes/hellwal/gtk-3.0/gtk.css

#gtk-2.0
cp ~/.cache/hellwal/gtkrc ~/.themes/hellwal/gtk-2.0/gtkrc

#kitty, vim, rofi use cache file in config
