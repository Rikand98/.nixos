{ lib, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      # File Management & System utils
      duf # disk information
      eza # ls replacement
      fd # find replacement
      file # File info
      playerctl # Controller for media players
      ripgrep # grep replacement
      gtrash # Trash manager (replacement for rm)
      wget # Utility to download files from the web
      xdg-utils # XDG user directories

      # System Monitoring
      caligula # Disk imaging tool
      ncdu # Disk space management

      # Maintenance
      bleachbit # Cache cleaner
      input-leap

      # Windows
      winetricks # Helper for Wine installation
    ]
    # Linux-only: no aarch64-darwin build, or Linux-only by nature.
    ++ lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard # Wayland clipboard utils
      poweralertd # Power management alert
      soundwireserver # Sound server tools
    ]
  );
}
