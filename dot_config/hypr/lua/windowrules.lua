browser = "firefox"
terminal = "wezterm"
file_manager = "thunar"

hl.window_rule({
    match = { class = "pavucontrol" },
    center = true,
    float = true,
    size = {"(monitor_w*0.45)", "(monitor_h*0.45)"}
})

hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    center = true,
    float = true,
    size = {"(monitor_w*0.45)", "(monitor_h*0.45)"}
})

hl.window_rule({
    match = { class = browser },
    center = true,
})

hl.window_rule({
    match = { class = terminal },
    center = true,
    float = true
})

hl.window_rule({
    match = { class = file_manager },
    center = true,
    float = true,
    size = {"(monitor_w*0.60)", "(monitor_h*0.45)"}
})

hl.window_rule({
    match = { class = "nm-connection-editor" },
    float = true,
    size = {"(monitor_w*0.50)", "(monitor_h*0.50)"}
})

hl.window_rule({
    match = { class = "blueman-manager" },
    float = true,
    size = {"(monitor_h*0.50)", "(monitor_h*0.60)"}
})

hl.window_rule({
    match = { class = "swaync" },
    animation = "popin"
})

hl.window_rule({
    match = { class = "rofi" },
    animation = "popin"
})

hl.window_rule({
    match = { class = "wlogout" },
    animation = "popin"
})


-- workspace rules --

