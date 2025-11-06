{ ... }:
''
  window-rule {
      geometry-corner-radius 9
      clip-to-geometry true
      draw-border-with-background false
  }
  window-rule {
      match app-id=r#"^org\.wezfurlong\.wezterm$"#
      open-maximized true
      open-on-workspace "Terminal"
  }
  window-rule {
      match app-id=r#"^discord"#
      open-maximized true
      open-on-output "HDMI-A-1"
      opacity 0.98
      open-on-workspace "Chat"
  }
  window-rule {
      match app-id=r#"^spotify"#
      open-maximized true
      open-on-output "HDMI-A-1"
      opacity 0.98
      open-on-workspace "Music"
  }
  window-rule {
      match app-id=r#"^steam"#
      open-on-output "DP-1"
      open-maximized true
      open-on-workspace "Game"
  }
  window-rule {
      match app-id=r#"^lutris"#
      open-on-output "DP-1"
      open-maximized true
      open-on-workspace "Game"
  }

  // Zen Browser and Zed settings
  window-rule {
      match app-id=r#"^(zen-beta|dev\.zed\.Zed)$"#
      opacity 0.98
      open-maximized true
      open-on-output "HDMI-A-1"
      open-on-workspace "Browser"
  }

''
