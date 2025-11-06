{ config, ... }:
let
  dmsPath = "${config.home.homeDirectory}/.local/bin/dms";

  # Determine launcher command based on barChoice
  launcherCommand = ''"fuzzel"'';
in
''
  binds {
      // === System & Overview ===
      Mod+Shift+Slash { show-hotkey-overlay; }

      // === Application Launchers ===
      Mod+W { spawn-sh "wezterm"; }
      Mod+B { spawn-sh "zen"; }
      Mod+R { spawn-sh "fuzzel"; }
      Mod+M { spawn "spotify"; }
      Mod+Y { spawn-sh "wezterm -e yazi"; }
      Mod+S { spawn-sh "steam"; }
      Mod+A { spawn-sh "lutris"; }
      Mod+D { spawn-sh "discord"; }
      Mod+T { spawn-sh "thunderbird"; }
      Mod+E { spawn-sh "nemo"; }
      Mod+Shift+S { spawn-sh "pwvucontrol"; }
      Mod+Ctrl+S { spawn-sh "easyeffect"; }
      Mod+Shift+B { spawn-sh "toggle_waybar"; }
      Mod+Alt+W { spawn-sh "wallpaper-picker"; }
      Mod+N { spawn-sh "swaync-client -t -sw"; }

      // === Security ===
      Mod+Escape { spawn "swaylock"; }
      Mod+Shift+Escape { spawn "power-menu"; }
      Mod+Shift+Q { quit; }

      // === Audio Controls ===
      XF86AudioPlay { spawn "playerctl" "play-pause"; }
      XF86AudioNext { spawn "playerctl" "next"; }
      XF86AudioPrev { spawn "playerctl" "previous"; }
      XF86AudioStop { spawn "playerctl" "stop"; }
      // Add XF86AudioMute if needed: spawn "pamixer" "-t";


      // === Window Management ===
      Mod+Q { close-window; }
      Mod+Shift+F { fullscreen-window; }
      Mod+F { maximize-column; }
      Mod+Space { toggle-window-floating; }

      // === Focus Navigation ===
      Mod+Ctrl+Left { focus-column-left; }
      Mod+Ctrl+Right { focus-column-right; }
      Mod+Ctrl+Up { focus-window-up; }
      Mod+Ctrl+Down { focus-window-down; }
      Mod+Ctrl+H { focus-column-left; }
      Mod+Ctrl+L { focus-column-right; }
      Mod+Ctrl+K { focus-window-up; }
      Mod+Ctrl+J { focus-window-down; }

      // === Window Movement ===
      Mod+Ctrl+Shift+Left { move-column-left; }
      Mod+Ctrl+Shift+Right { move-column-right; }
      Mod+Ctrl+Shift+Up { move-window-up; }
      Mod+Ctrl+Shift+Down { move-window-down; }
      Mod+Ctrl+Shift+H { move-column-left; }
      Mod+Ctrl+Shift+L { move-column-right; }
      Mod+Ctrl+Shift+K { move-window-up; }
      Mod+Ctrl+Shift+J { move-window-down; }

      // === Monitor Navigation ===
      Mod+Left { focus-monitor-left; }
      Mod+Right { focus-monitor-right; }
      Mod+H { focus-monitor-left; }
      Mod+L { focus-monitor-right; }

      // === Move to Monitor ===
      Mod+Shift+Left { move-column-to-monitor-left; }
      Mod+Shift+Right { move-column-to-monitor-right; }
      Mod+Shift+H { move-column-to-monitor-left; }
      Mod+Shift+L { move-column-to-monitor-right; }

      // === Workspace Navigation ===
      Mod+J { focus-workspace-down; }  // Approximate
      Mod+K { focus-workspace-up; }
      Mod+Down { focus-workspace-down; }
      Mod+Up { focus-workspace-up; }

      // === Move Workspaces ===
      Mod+Shift+J { move-workspace-down; }
      Mod+Shift+K { move-workspace-up; }

      // === Mouse Wheel Navigation ===
      Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
      Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
      Mod+WheelScrollRight { focus-column-right; }
      Mod+WheelScrollLeft { focus-column-left; }
      Mod+Ctrl+WheelScrollDown { move-column-to-workspace-down; }
      Mod+Ctrl+WheelScrollUp { move-column-to-workspace-up; }
      Mod+Ctrl+WheelScrollRight { move-column-right; }
      Mod+Ctrl+WheelScrollLeft { move-column-left; }

      // === Numbered Workspaces ===
      Mod+1 { focus-workspace "Browser"; }
      Mod+2 { focus-workspace "Terminal"; }
      Mod+3 { focus-workspace "Chat"; }
      Mod+4 { focus-workspace "Game"; }
      Mod+5 { focus-workspace "Music"; }
      Mod+6 { focus-workspace "Settings"; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      Mod+0 { focus-workspace 10; }

      // === Move to Numbered Workspaces ===
      Mod+Shift+1 { move-column-to-workspace "Browser"; }
      Mod+Shift+2 { move-column-to-workspace "Terminal"; }
      Mod+Shift+3 { move-column-to-workspace "Chat"; }
      Mod+Shift+4 { move-column-to-workspace "Game"; }
      Mod+Shift+5 { move-column-to-workspace "Music"; }
      Mod+Shift+6 { move-column-to-workspace "Settings"; }
      Mod+Shift+7 { move-column-to-workspace 7; }
      Mod+Shift+8 { move-column-to-workspace 8; }
      Mod+Shift+9 { move-column-to-workspace 9; }
      Mod+Shift+0 { move-column-to-workspace 10; }

      // === Manual Sizing ===
      Mod+Minus { set-column-width "-10%"; }
      Mod+Equal { set-column-width "+10%"; }
      Mod+Shift+Minus { set-window-height "-10%"; }
      Mod+Shift+Equal { set-window-height "+10%"; }

      // === Screenshots ===
      Print { screenshot; }  // --copy equivalent (clipboard)
      Mod+Print { screenshot-screen; }  // --save (full screen)
      Mod+Shift+Print { screenshot-window; }  // --swappy (window; pipe to swappy if needed: spawn-sh "grim | swappy -f -")


      // === System Controls ===
      Mod+Alt+P { power-off-monitors; }

      // === Custom Application Launchers ===
      Mod+V { spawn "sh" "-c" "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"; } // Clipboard manager

      // === Color picker ===
      Mod+C { spawn-sh "niri msg pick-color | grep 'Hex:' | cut -d' ' -f2 | wl-copy"; }
  }
''
