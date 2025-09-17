#!/bin/sh

# Custom dmenu for changing colorscheme via hellwal themes

MENU="random|gruvbox|tokyo-night|catppuccin|frieren"
FONT_NAME="FiraCode Nerd Font"
FONT_SIZE=14

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Colorscheme" -hide-scrollbar -tokenize -lines 2 -width 50 -padding 50 -disable-history -font "$FONT_NAME $FONT_SIZE")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "random" ];
then
  exec ~/.scripts/change_current_theme.sh

elif [ "$DIALOG_RESULT" = "gruvbox" ];
then
	exec ~/.scripts/change_current_theme.sh gruvbox.hellwal

elif [ "$DIALOG_RESULT" = "tokyo-night" ];
then
	exec ~/.scripts/change_current_theme.sh tokyo-night.hellwal

elif [ "$DIALOG_RESULT" = "catppuccin" ];
then
	exec ~/.scripts/change_current_theme.sh catppuccin.hellwal

elif [ "$DIALOG_RESULT" = "frieren" ];
then
  exec ~/.scripts/change_current_theme.sh frieren.hellwal

fi
