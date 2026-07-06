local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "rose-pine-moon"
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Set custom dimensions
config.initial_cols = 120
config.initial_rows = 40

return config

