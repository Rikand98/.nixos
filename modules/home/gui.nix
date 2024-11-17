{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    # Productivity Apps
    libreoffice-qt6-fresh
    qalculate-gtk                     # Calculator
    thunderbird                       # Email client
    zenity                            # GUI dialogs

    # Video & Image Viewers
    imv                              # CLI image viewer
    mpv                              # Video player
    vlc                              # GUI video player

    # Creative & Editing Tools
    audacity                         # Audio editor
    obs-studio                       # Streaming/recording
    pitivi                           # Video editor
    gimp                              # Image editor
    zathura                           # pdf viewer
  ]);
}
