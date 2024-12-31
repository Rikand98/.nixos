{ pkgs, inputs, username, hostname, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username hostname; };
    users.${username} = {
      imports =[ ./../../home/default.darwin.nix ];
      home.username = "${username}";
      home.homeDirectory = "/Users/${username}";
      # home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
  };

  users = {
    ${username} = {
      isNormalUser = true;
      description = "${username}";
      extraGroups = [ "wheel" ]; # No networkmanager group on Darwin
      shell = pkgs.fish;
    };
  };
}
