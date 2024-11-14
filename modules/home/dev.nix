{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    # C/C++ Development
    ninja
    gcc
    gdb
    gnumake
    valgrind

    # Python
    python3
    python312Packages.ipython
    python312Packages.pip

    # Flutter & Dart
    flutter

    # Android Development
    android-studio
    firebase-tools

    # Git & Git-related utilities
    lazygit
    onefetch
    nix-prefetch-github

    # SQL and Geospatial Libraries
    postgresql_17
    postgresql17Packages.postgis
    sqlite
    mariadb_114
    gdal


    # LaTeX for typesetting
    texliveFull
  ]);
}
