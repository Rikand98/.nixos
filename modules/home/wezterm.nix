{ inputs, pkgs, host, ... }:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require "wezterm"

      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
          config = wezterm.config_builder()
      end
      config.max_fps = 144

      config.check_for_updates = false
      config.automatically_reload_config = false

      config.font = wezterm.font("JetBrainsMono Nerd Font")
      config.font_size = ${if (host == "laptop") then "10" else "12"}
      config.cell_width = 1
      config.underline_thickness = 2

      config.default_prog = { 'fish' }

      config.window_decorations = "NONE"
      config.window_background_opacity = 0.98
      config.window_close_confirmation = 'NeverPrompt'
      config.window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,
      }
      config.default_cursor_style = "SteadyBlock"

      config.enable_scroll_bar    = false
      config.warn_about_missing_glyphs = false

      config.scrollback_lines = 10000
      -- config.harfbuzz_features = { "cv30", "cv21", "cv32", "ss09" }
      config.freetype_load_flags = 'NO_HINTING'
      config.freetype_load_target = 'Light'
      config.freetype_render_target = 'HorizontalLcd'

      config.color_scheme = 'Gruvbox Material (Gogh)'
      config.bold_brightens_ansi_colors = false

      --# tab bar
      config.hide_tab_bar_if_only_one_tab = true
      config.tab_bar_at_bottom = true
      config.use_fancy_tab_bar = false
      -- config.tab_and_split_indices_are_zero_based = true

      -- unbind keys
      config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
      config.keys = {
        { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment, },
        { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment, },
        { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment, },
        { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment, },
        { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection="Up", },
        { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection="Down", },
        { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection="Left", },
        { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection="Right", },
        { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane, },
        { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal={domain="CurrentPaneDomain"}, },
        { key = '-', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical={domain="CurrentPaneDomain"}, },
        { key = 'h', mods = 'CTRL|ALT', action = wezterm.action.ActivateTabRelative=-1, },
        { key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ActivateTabRelative=1, },
        { key = 'd', mods = 'CTRL|ALT', action = wezterm.action.CloseCurrentTab{confirm=true}, },
      }
      -- remove copy on highlight
      config.mouse_bindings = {
        {
          event = { Up = { streak = 1, button = "Left" } },
          mods = "NONE",
          action = wezterm.action.Nop,
        },
      }

      return config
    '';
  };
}
