hl.on("hyprland.start", function ()
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("swaync & flameshot & hypridle")
    hl.exec_cmd("swaybg -i /home/tyrone/Downloads/Wallpapers/wallpaper19.jpg -m fill")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

