#!/bin/sh

hellwal --theme $1 #theme path for hellwal (ex: gruvbox.hellwal)

# first, restart awesome to apply theme                                                       
awesome-client 'awesome.restart()'                                                            
                                                                                              
# then do the rest                                                                            
source ~/.cache/hellwal/variables.sh   

theme=${1%.*} #slice var until .
                                                                                              
# set wallpaper                                                                               
feh --bg-fill "$(find ~/Pictures/Wallpapers/ -type f -name "${theme}*" | shuf -n 1)"                                                                    
                                                                                              
# Rofi                                                                                        
cp ~/.cache/hellwal/rofi.rasi ~/.config/rofi/config.rasi                                      
                                                                                              
# Firefox                                                                                     
cp ~/.cache/hellwal/pywalfox.json ~/.cache/wal/colors.json                                    
pywalfox update                                                                               
                                                                                              
#kitty and vim automatically take colorcscheme (vim needs to relaunch)
