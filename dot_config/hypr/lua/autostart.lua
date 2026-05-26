hl.on("hyprland.start", function ()
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("flameshot")
    hl.ecex_cmd("blueman-manager")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

