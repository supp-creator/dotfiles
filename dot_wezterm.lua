local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_wayland = false

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 12.0

config.color_scheme = 'tokyonight'

config.window_background_opacity = 1.00
config.macos_window_background_blur = 20

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.scrollback_lines = 10000

config.audible_bell = 'Disabled'


config.default_cursor_style = 'SteadyBlock'

config.term = 'xterm-256color'

return config
