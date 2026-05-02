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
    match = { class = "app.zen_browser.zen" },
    center = true,
})

hl.window_rule({
    match = { class = "alacritty" },
    center = true,
    float = true
})

hl.window_rule({
    match = { class = "thunar" },
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
    float = true
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
