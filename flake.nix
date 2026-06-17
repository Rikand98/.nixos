{
  description = "Rikand's nixos/darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    niri = {
      url = "github:YaLTeR/niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      flake-utils,
      self,
      sops-nix,
      ...
    }@inputs:
    let
      user_info = import ./user_info.nix;
      username = user_info.username;
      hostname_1 = user_info.hostname_1;
      system_1 = user_info.system_1;
      hostname_2 = user_info.hostname_2;
      system_2 = user_info.system_2;
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            nil
            nixpkgs-fmt
            (lib.optionalAttrs (system == "aarch64-darwin") darwin.apple_sdk.frameworks.SystemConfiguration)
          ];
        };
      }
    )
    // {
      # ── NixOS (Linux) ─────────────────────────────────────────────────────
      nixosConfigurations = {
        home-desktop = nixpkgs.lib.nixosSystem {
          system = system_1;
          modules = [
            ./hosts/${hostname_1}
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  username
                  user_info
                  ;
              };
            }
          ];
          specialArgs = {
            inherit
              inputs
              username
              user_info
              ;
            hostname = hostname_1;
            system = system_1;
          };
        };
      };

      # ── Darwin (macOS) ───────────────────────────────────────────────────
      darwinConfigurations = {
        lysio-macbook = nix-darwin.lib.darwinSystem {
          system = system_2;
          modules = [
            ./hosts/${hostname_2}
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                hostname = hostname_2;
                inherit inputs username user_info;
              };
            }
          ];
          specialArgs = {
            hostname = hostname_2;
            system = system_2;
            inherit inputs username user_info;
          };
        };
      };

      formatter = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
