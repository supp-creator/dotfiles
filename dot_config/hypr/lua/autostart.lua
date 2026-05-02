hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar & swaync & flameshot & hypridle")
    hl.exec_cmd("swaybg -i /home/tyrone/Downloads/Wallpapers/wallpaper16.png -m fill")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

