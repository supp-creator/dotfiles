
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        gaps_workspace = 0,
        layout = dwindle, --master/scrolling/dwindle/monocle
        allow_tearing = false,
        resize_on_border = true
    },

    decoration = {
        rounding = 10,
        active_opacity = 1.00,
        rounding_power = 5.00,
        inactive_opacity = 1.00,
        fullscreen_opacity = 1.00,

        blur = {
            enabled = true,
            size = 10,
            ignore_opacity = true,
            new_optimizations = true,
        },
    },

    animations = { enabled = true, },
})

hl.config({
    misc = {
        force_defualt_wallpaper = -1.
        disable_hyprland_logo = false,
    },
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.5,
        explicit_column_widths = 0.667,
        direction = "right",
    },
})

hl.config({
    dwindle = {
        pseudotile = true,
        preserve_split = true,
    },
})

hl.config({
    master = {
        allow_small_split = true,
        special_scale_factor = 0.5,
        mfact = 0.6,
        new_status = slave,
        new_on_top = true,
        orientation = "left",
    },
})

hl.gesture({
    workspace_swipe_touch = false,
})

--ENVIRONMENT

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

hl.env("GDK_SCALE", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("APPIMAGELAUNCHER_DISABLE", "0")
hl.env("OZONE_PLATFORM", "wayland")
