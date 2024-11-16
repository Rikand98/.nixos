{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    # C/C++ Development
    ninja
    gcc
    gdb
    gnumake
    valgrind
    libstdcxx5

    # Python
    python3
    # python312Packages.gdal
    poetry

    # Flutter & Dart
    flutter

    # Android Development
    android-studio
    android-tools
    firebase-tools
    google-cloud-sdk

    # Git & Git-related utilities
    lazygit
    onefetch
    nix-prefetch-github

    # LaTeX for typesetting
    texliveFull

    #geo data
    gdal
  ]);
}
