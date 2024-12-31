{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./network.nix
    ./nh.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];
}
