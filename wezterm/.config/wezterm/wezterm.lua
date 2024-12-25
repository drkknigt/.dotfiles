local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Batman"

config.color_schemes = {
	["Batman"] = {
		background = "00000f",
	},
}
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.warn_about_missing_glyphs = false
config.window_background_opacity = 0.9
return config
