{ pkgs, ... }:
{
  # Imported only on Linux (see packages/default.nix) — these are desktop apps
  # with no aarch64-darwin build (mission-center, pitivi, gimp, obs, vlc, …).
  home.packages = (
    with pkgs;
    [
      # Productivity Apps
      libreoffice-qt6-fresh
      qalculate-gtk # Calculator
      thunderbird # Email client
      mission-center # GUI resources monitor
      zenity # GUI dialogs

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
