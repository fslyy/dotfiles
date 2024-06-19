#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run "light-locker"
run "picom"
run "/home/felix/.config/polybar/launch.sh"
