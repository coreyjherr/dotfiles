local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  "Fira Code",
}

config.color_scheme = "Dracula (Official)"
config.use_fancy_tab_bar = false
config.window_decorations = "NONE"

return config
