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
    nixosSystems = [ "x86_64-linux" "aarch64-linux" ];
    darwinSystems = [ "aarch64-darwin" "x86_64-darwin" ];  # Darwin system
    pkgs = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = nixpkgs.lib.genAttrs nixosSystems (system: {
      system = system;
      configuration = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/nixos/${hostname} ];
        specialArgs = { hostname = "${hostname}"; inherit self inputs username; };
      };
    });
    darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (system: {
      system = system;
      configuration = pkgs.system {
        inherit system;
        modules = [ ./hosts/darwin/${hostname} ];
        specialArgs = { hostname = "${hostname}"; inherit self inputs username; };
      };
    });
  };
}
