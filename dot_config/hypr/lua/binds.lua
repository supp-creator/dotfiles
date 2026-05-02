
-- actions
hl.bind("SUPER + RETURN", hl.dps.exec_cmd("alacritty"))
hl.bind("SUPER + Q", hl.dps.exec_cmd("killactive"))
hl.bind("SUPER + W", hl.dps.exec_cmd("wlogout"))
hl.bind("SUPER + T", hl.dps.exec_cmd("togglefloating"))
hl.bind("SUPER + F", hl.dps.exec_cmd("fullscreen"))
hl.bind("SUPER + D", hl.dps.exec_cmd("rofi -show drun"))
hl.bind("SUPER + P", hl.dps.exec_cmd("pseudo"))


hl.bind("SUPER + B", hl.dps.exec_cmd("app.zen_browser.zen"))
hl.bind("SUPER + SHIFT + B", hl.dps.exec_cmd("~/.scripts/reload-waybar.sh"))
hl.bind("SUPER + L", hl.dps.exec_cmd("hyprlock"))
hl.bind("SUPER + N", hl.dps.exec_cmd("swaync-client -t"))
hl.bind("SUPER + Space", hl.dps.exec_cmd("thunar"))
hl.bind("SUPER + V", hl.dps.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind("Print", hl.dps.exec_cmd("flameshot gui"))

hl.bind("XF86AudioRaiseVolume", hl.dps.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dps.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dps.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dps.exec_cmd("brightnessctl set 10%+") { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dps.exec_cmd("brightnessctl set 10%-") { repeating = true })

hl.bind("XF86AudioMicMute", hl.dps.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") { locked = true })

-- workplaces

hl.bind("SUPER + 1", hl.dps.focus({ 1, on_current_monitor }))
hl.bind("SUPER + 2", hl.dps.focus({ 2, on_current_monitor }))
hl.bind("SUPER + 3", hl.dps.focus({ 3, on_current_monitor }))
hl.bind("SUPER + 4", hl.dps.focus({ 4, on_current_monitor }))
hl.bind("SUPER + 5", hl.dps.focus({ 5, on_current_monitor }))
hl.bind("SUPER + 6", hl.dps.focus({ 6, on_current_monitor }))
hl.bind("SUPER + 7", hl.dps.focus({ 7, on_current_monitor }))
hl.bind("SUPER + 8", hl.dps.focus({ 8, on_current_monitor }))
hl.bind("SUPER + 9", hl.dps.focus({ 9, on_current_monitor }))
