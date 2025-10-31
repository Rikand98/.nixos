{
  hostname,
  config,
  pkgs,
  ...
}:
let

  keybindsModule = import ./keybinds.nix { inherit config; };
  windowrulesModule = import ./windowrules.nix { };
  layoutModule = import ./layout.nix { };

  hostOutputsPath = ./hosts/${hostname}/outputs.nix;
  hostOutputs =
    if builtins.pathExists hostOutputsPath then import hostOutputsPath { host = hostname; } else "";

  hostWindowRulesPath = ./hosts/${hostname}/windowrules.nix;
  hostWindowRules =
    if builtins.pathExists hostWindowRulesPath then
      import hostWindowRulesPath { host = hostname; }
    else
      "";

in
{
  home.packages = with pkgs; [
    niri
    swww
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    swappy
    xdg-desktop-portal-gnome
    xwayland-satellite
    wineWowPackages.wayland
  ];
  xdg.configFile."niri/config.kdl".text = ''

    spawn-sh-at-startup "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
    spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
    spawn-sh-at-startup "swww-daemon";
    spawn-sh-at-startup "sh -c swww init && swww img $(find ~/Pictures/Wallpapers/ -maxdepth 1 -type f | shuf -n 1) --transition-type none";
    spawn-sh-at-startup "waypaper --wallpaper ~/Pictures/Wallpapers/forest_pastel.png";
    spawn-sh-at-startup "swayidle timeout 300 swaylock -f";
    spawn-sh-at-startup "niri msg setcursor 'Capitaine Cursors (Gruvbox)' 24&"
    spawn-at-startup "waybar"
    spawn-at-startup "swaync"
    spawn-at-startup "hyprlock"

      ${hostOutputs}

      ${layoutModule}

      ${keybindsModule}

      ${windowrulesModule}

      ${hostWindowRules}


    cursor {
    xcursor-theme "Capitaine Cursors (Gruvbox)"
    xcursor-size 24
    }

    environment {
        XDG_CURRENT_DESKTOP "niri"
        MOZ_ENABLE_WAYLAND "1"
        ELECTRON_OZONE_PLATFORM_HINT "wayland"
        QT_QPA_PLATFORM "wayland"
        QT_QPA_PLATFORMTHEME_QT6 "gtk3";
        TERMINAL "wezterm"
      }


      hotkey-overlay {
          skip-at-startup
      }

      prefer-no-csd



  '';

  # XWayland satellite service for X11 app support
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside Wayland";
      BindsTo = "graphical-session.target";
      After = "graphical-session.target";
    };
    Service = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      StandardOutput = "journal";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # XDG Desktop Portal services - properly configured for screen sharing
  systemd.user.services.xdg-desktop-portal = {
    Unit = {
      Description = "Portal service";
      After = [
        "graphical-session.target"
        "pipewire.service"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.portal.Desktop";
      ExecStart = "${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal";
      Restart = "on-failure";
      Environment = [
        "XDG_CURRENT_DESKTOP=niri"
        "WAYLAND_DISPLAY=wayland-1"
      ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services.xdg-desktop-portal-gnome = {
    Unit = {
      Description = "Portal service (GNOME implementation)";
      After = [
        "graphical-session.target"
        "pipewire.service"
        "xdg-desktop-portal.service"
      ];
      PartOf = [ "graphical-session.target" ];
      Requires = [ "pipewire.service" ];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.gnome";
      ExecStart = "${pkgs.xdg-desktop-portal-gnome}/libexec/xdg-desktop-portal-gnome";
      Restart = "on-failure";
      Environment = [
        "XDG_CURRENT_DESKTOP=niri"
      ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    Unit = {
      Description = "Portal service (GTK/GNOME implementation)";
      After = [
        "graphical-session.target"
        "xdg-desktop-portal.service"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.gtk";
      ExecStart = "${pkgs.xdg-desktop-portal-gtk}/libexec/xdg-desktop-portal-gtk";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Place wallpapers in home directory
  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };
}
