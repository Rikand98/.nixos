{
  description = "Rikand's nixos/darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Linux-only inputs (Hyprland ecosystem) - ignored on Darwin
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    nur.url = "github:nix-community/NUR";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, flake-utils, self, ... }@inputs:
    let
      secrets = import ./secrets.nix;
      username = secrets.username;
      hostname = secrets.hostname;
    in
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            (import nixpkgs { inherit system; }).darwin.apple_sdk.frameworks.SystemConfiguration
            just
            nil
            nixpkgs-fmt
          ];
        };
      }
    )
    // {
      # NixOS configurations (Linux) - e.g., for home-desktop
      nixosConfigurations = {
        ${secrets.hostname} = lib.nixosSystem {
          system = "x86_64-linux"; 
          modules = [
            ./hosts/${secrets.hostname}  
            home-manager.nixosModules.home-manager  
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs username secrets; };  
            }
          ];
          specialArgs = {
            inherit inputs username secrets;
            hostname = secrets.hostname; 
          };
        };
      };

      # Darwin configurations (macOS)
      darwinConfigurations = {
        ${hostname} = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/${hostname}
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs username hostname secrets; };
            }
          ];
          specialArgs = {
            inherit inputs username hostname secrets system = "aarch64-darwin";
          };
        };
      };

      formatter = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
