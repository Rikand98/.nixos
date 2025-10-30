{ ... }:
''
  // Work around WezTerm's initial configure bug
  window-rule {
      match app-id=r#"^org\.wezfurlong\.wezterm$"#
      default-column-width {}
  }

  // Global window styling
  window-rule {
      geometry-corner-radius 9
      clip-to-geometry true
      draw-border-with-background false
  }

  window-rule {
      match app-id=r#"^discord"#
      default-column-width { proportion 1.0; }
      open-on-output "HDMI-A-1"
      opacity 0.9
  }

  window-rule {
      match app-id=r#"^(steam|lutris)"#
      open-on-output "DP-1"
      open-fullscreen true
  }

  // Zen Browser and Zed settings
  window-rule {
      match app-id=r#"^(zen-beta|dev\.zed\.Zed)$"#
      opacity 0.98
      default-column-width { proportion 0.75; }
  }

''
