#!/usr/bin/env bash
pkill waybar
waybar &
notify-send "Waybar" "reloaded"
