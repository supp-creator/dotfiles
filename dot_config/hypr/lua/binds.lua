terminal = "wezterm"
browser = "firefox"
file_manager = "thunar"


-- actions
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))


hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:272", hl.dsp.window.resize(), { mouse = true })


hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
-- hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("~/.scripts/reload-waybar.sh"))
-- hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + Space", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { repeating = true })

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- workplaces

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1, on_current_monitor = true }))
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1, on_current_monitor = true }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2, on_current_monitor = true }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3, on_current_monitor = true }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4, on_current_monitor = true }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5, on_current_monitor = true }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6, on_current_monitor = true }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7, on_current_monitor = true }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8, on_current_monitor = true }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9, on_current_monitor = true }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1}))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2}))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3}))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4}))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5}))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6}))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8}))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9}))

hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())

-- noctalia --

hl.bind("SUPER + D", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

hl.bind("SUPER + S", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call controlCenter toggle"))

hl.bind("SUPER + H", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call settings toggle"))

hl.bind("SUPER + A", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call wallpaper toggle"))

hl.bind("SUPER + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))
