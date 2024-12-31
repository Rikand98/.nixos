{
  description = "Rikand's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:fufexan/zen-browser-flake";
  };

  outputs = { nixpkgs, self, ...} @ inputs:
  let
    username = "rikand";
    hostname = "home-desktop";
    nixosSystems = [ "x86_64-linux" "aarch64-linux"];
    darwinSystems = [ "aarch64-darwin" "x86_64-darwin" ];

    pkgs = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    # Function to generate system configurations
    createSystemConfiguration = system: modules: specialArgs: {
      system = system;
      specialArgs = specialArgs;
      modules = modules;
    };

  in
  {
  # NixOS configurations
   nixosConfigurations = nixpkgs.lib.genAttrs nixosSystems (system: {
      system = system;
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/${hostname} ];
        specialArgs = { hostname = hostname; inherit self inputs username; };
      };
    });

    # Darwin configurations
    darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (system: {
      darwin = createSystemConfiguration system
        [ ./hosts/${hostname} ]  # Modules for Darwin
        { hostname = hostname; inherit self inputs username; };
    });
  };
}
