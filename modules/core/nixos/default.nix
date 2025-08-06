{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}:
{
  imports = [
    ./bootloader.nix
    # ./database.nix
    ./flatpak.nix
    ./gaming.nix
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./services.nix
    ./security.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
