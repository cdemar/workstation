local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ############################################################
-- UI & AESTHETICS
-- ############################################################
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 18.0
config.line_height = 1.1

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 15

config.window_padding = {
	left = ".75cell",
	right = ".75cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

-- Large window on launch
config.initial_cols = 200
config.initial_rows = 60

-- Performance & Cursor
config.scrollback_lines = 10000
config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 600
config.animation_fps = 120

-- ############################################################
-- COLORS & PANE DIMMING
-- ############################################################
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#C8D3F5", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#C8D3F5", "#24EAF7" },
}

-- Dim inactive panes so you always know where focus is
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}

-- ############################################################
-- KEYBINDINGS
-- ############################################################
config.keys = {
	-- Splits (Alt + s/v)
	{ key = "s", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Pane zoom (Alt + z)
	{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },

	-- Pane navigation (Cmd + h/j/k/l)
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Pane resizing (Cmd + Shift + h/j/k/l)
	{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "j", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	-- Reload config (Cmd + Shift + r)
	{ key = "r", mods = "CMD|SHIFT", action = wezterm.action.ReloadConfiguration },

	-- Tab management
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "CMD", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CMD", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

return config
