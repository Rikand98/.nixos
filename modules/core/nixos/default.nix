{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./bootloader.nix
    ./database.nix
    ./xserver.nix
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}
