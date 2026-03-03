local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

-- config.initial_cols = 120
-- config.initial_rows = 28

config.font_size = 12
config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font",
  "JetBrains Mono",
})
config.color_scheme = 'Kanagawa (Gogh)'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.window_close_confirmation = "NeverPrompt"

config.adjust_window_size_when_changing_font_size = false

config.mouse_bindings = {
  -- Zoom in with Ctrl + WheelUp
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },

  -- Zoom out with Ctrl + WheelDown
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize,
  },
}

local is_windows = wezterm.target_triple:find("windows")

if is_windows then
  -- Windows (installed via scoop, winget, or MSI)
  config.default_prog = { "nu.exe", "-l" }
else
  -- Linux / macOS
  config.default_prog = { wezterm.home_dir .. "/.nix-profile/bin/nu" }
end

return config
