{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      #Terminal AI coding agent
      opencode

      # C/C++ Development
      ninja
      gcc
      gdb
      gnumake
      valgrind

      # Zig
      zig
      zigfetch

      # Python
      python3
      python314Packages.ipython
      pipx
      uv

      # Rust
      rustup

      # GoLang
      go

      # Git & Git-related utilities
      onefetch
      nix-prefetch-github

      # LaTeX for typesetting
      texliveFull

      #geo data
      gdal
    ]
  );
}
