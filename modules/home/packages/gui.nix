{ pkgs, ... }:
{
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
