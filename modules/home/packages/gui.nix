{ lib, pkgs, ... }:
{
  # Desktop apps with no aarch64-darwin build (mission-center, pitivi, gimp,
  # obs, vlc, …). Gated here rather than in imports: referencing pkgs in
  # imports forces _module.args -> config -> imports and recurses infinitely.
  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux (
    with pkgs;
    [
      # Productivity Apps
      libreoffice-qt6-fresh
      qalculate-gtk # Calculator
      thunderbird # Email client
      mission-center # GUI resources monitor
      zenity # GUI dialogs
      zmk-studio

      # Video & Image Viewers
      vlc # GUI video player

      # Creative & Editing Tools
      audacity # Audio editor
      obs-studio # Streaming/recording
      pitivi # Video editor
      gimp # Image editor
      zathura # pdf viewer
    ]
  );
}
