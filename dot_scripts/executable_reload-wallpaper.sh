#!/usr/bin/env bash
pkill swaybg
swaybg -i "$1" -m fill &
notify-send "Wallpaper" "changed to $1"
