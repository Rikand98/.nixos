{ lib, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      #Fun CLI Tools
      asciiquarium-transparent
      cbonsai # ASCII bonsai tree
      cmatrix # Matrix screen effect
      countryfetch
      cowsay
      figlet
      fortune
      lavat
      lolcat
      pipes # Pipe screensaver
      sl # Steam locomotive

      # Multimedia
      ani-cli # CLI anime player
      lowfi
      mpv

      # Binary/Hex Utils
      binsider # Binary viewer
      bitwise # Bit/hex manipulation
      programmer-calculator

      # File & Document Tools
      docfd # Fuzzy finder for documents
      jq # JSON processor
      ffmpeg
      gifsicle
      yt-dlp-light

      #System Utils
      openssl # Security tools
      entr # Run command when files change
      libnotify # Notification system
      tldr # Simplified man pages
      tdf # CLI PDF viewer
      todo # CLI to-do list
      ttyper # CLI typing test
      gtt # Google Translate
      man-pages # Additional man pages
      unzip
    ]
    # Linux-only: no aarch64-darwin build.
    ++ lib.optionals pkgs.stdenv.isLinux [
      nitch # System info fetcher
      swappy # Snapshot editing tool
      xxd # Hex/bit manipulation
      hexdump # Hex viewer
    ]
  );
}
