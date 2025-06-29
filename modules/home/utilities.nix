{inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
    # File Management & System utils
    eza                               # ls replacement
    fd                                # find replacement
    file                              # File info
    mimeo                             # Open files by MIME type
    playerctl                         # Controller for media players
    ripgrep                           # grep replacement
    gtrash                            # Trash manager (replacement for rm)
    wl-clipboard                      # Wayland clipboard utils
    wget                              # Utility to download files from the web
    xdg-utils                         # XDG user directories

    # System Monitoring
    caligula                          # Disk imaging tool
    ncdu                              # Disk space management
    poweralertd                       # Power management alert
    killall                           # Process management

    # Maintenance
    bleachbit                         # Cache cleaner
    pavucontrol                       # PulseAudio control
    soundwireserver                   # Sound server tools
    rivalcfg                          # SteelSeries mouse program
    deskflow                          # Software kvm


    # Windows
    winetricks                        # Helper for Wine installation
    wineWowPackages.wayland           # Wine for Wayland

    inputs.alejandra.defaultPackage.${system}
  ]);
}
