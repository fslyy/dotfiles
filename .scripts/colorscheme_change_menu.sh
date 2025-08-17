#!/bin/sh

MENU="gruvbox|tokyo-night"
FONT_NAME="mono-space"
FONT_SIZE=18

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Colorscheme" -hide-scrollbar -tokenize -lines 2 -width 50 -padding 50 -disable-history -font "$FONT_NAME $FONT_SIZE")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "gruvbox" ];
then
	exec ~/.scripts/change_to_selected_theme.sh gruvbox.hellwal

elif [ "$DIALOG_RESULT" = "tokyo-night" ];
then
	exec ~/.scripts/change_to_selected_theme.sh tokyo-night.hellwal
fi
