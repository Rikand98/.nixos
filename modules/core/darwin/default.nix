{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./network.nix
    ./nh.nix
    ./program.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];
}
