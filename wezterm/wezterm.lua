local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "rose-pine-moon"
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14.0
-- config.window_background_opacity = 0.8
config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 50
config.macos_window_background_blur = 30
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Set custom dimensions
config.initial_cols = 120
config.initial_rows = 40

config.keys = {
	{ key = "[", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
	-- Option-Left/Right send Alt-b/Alt-f, which zsh/readline interpret as backward-word/forward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
}

-- Let CMD bypass mouse reporting (like the default SHIFT does), so
-- CMD-click still opens hyperlinks in apps that capture the mouse (e.g. nvim with mouse=a)
config.bypass_mouse_reporting_modifiers = "CMD"

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.Nop,
	},
}

return config

