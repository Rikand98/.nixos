{ pkgs, inputs, username, hostname, ... }:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ]; # Use Darwin-specific module for clarity

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username hostname; };
    users.${username} = {
      imports = [ ./../../home/default.darwin.nix ];
      home.username = "${username}";
      home.homeDirectory = "/Users/${username}";
      home.stateVersion = "25.05"; # Set to match nixpkgs version (check flake.lock)
      programs.home-manager.enable = true;
    };
  };
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.fish; # Consistent with programs.fish in program.nix
  };
}
