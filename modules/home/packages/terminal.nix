{ pkgs, ... }:
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
      nitch # System info fetcher
      pipes # Pipe screensaver
      sl # Steam locomotive
      tty-clock # CLI clock

      # Multimedia
      ani-cli # CLI anime player
      imv
      lowfi
      mpv

      # Binary/Hex Utils
      binsider # Binary viewer
      bitwise # Bit/hex manipulation
      programmer-calculator
      xxd # Hex/bit manipulation

      # File & Document Tools
      docfd # Fuzzy finder for documents
      jq # JSON processor
      hexdump # Hex viewer
      ffmpeg
      gifsicle
      yt-dlp-light
      swappy # Snapshot editing tool

      #System Utils
      openssl # Security tools
      entr # Run command when files change
      libnotify # Notification system
      tldr # Simplified man pages
      tdf # CLI PDF viewer
      todo # CLI to-do list
      toipe # Typing test in terminal
      ttyper # CLI typing test
      gtt # Google Translate
      man-pages # Additional man pages
      unzip
    ]
  );
}
