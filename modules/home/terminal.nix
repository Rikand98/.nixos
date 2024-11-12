{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    #Fun CLI Tools
    ani-cli                           # CLI anime player
    cbonsai                           # ASCII bonsai tree
    cmatrix                           # Matrix screen effect
    nitch                             # System info fetcher
    pipes                             # Pipe screensaver
    sl                                # Steam locomotive
    tty-clock                         # CLI clock

    # Binary/Hex Utils
    binsider                          # Binary viewer
    bitwise                           # Bit/hex manipulation
    programmer-calculator
    xxd                               # Hex/bit manipulation

    # File & Document Tools
    docfd                             # Fuzzy finder for documents
    jq                                # JSON processor
    hexdump                           # Hex viewer
    ffmpeg
    gifsicle
    yt-dlp-light
    swappy                           # Snapshot editing tool

    #System Utils
    openssl                           # Security tools
    entr                              # Run command when files change
    libnotify                         # Notification system
    tldr                              # Simplified man pages
    tdf                               # CLI PDF viewer
    todo                              # CLI to-do list
    toipe                             # Typing test in terminal
    ttyper                            # CLI typing test
    gtt                               # Google Translate
    man-pages                         # Additional man pages
    unzip
  ]);
}
