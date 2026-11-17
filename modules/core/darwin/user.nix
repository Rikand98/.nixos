{ pkgs, inputs, username, hostname, user_info, ... }:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username hostname user_info; };
    users.${username} = {
      imports = [ ./../../home/default.darwin.nix ];
      home.username = "${username}";
      home.homeDirectory = "/Users/${username}";
      home.stateVersion = "25.05"; # Install-time version — do not bump
      programs.home-manager.enable = true;
    };
  };
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.fish;
  };
}
