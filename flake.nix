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
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      flake-utils,
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
            nixfmt
          ];
        };

        formatter = pkgs.nixfmt;
      }
    )
    // {
      # ── NixOS (Linux) ─────────────────────────────────────────────────────
      # home-manager is wired up in modules/core/nixos/user.nix
      nixosConfigurations = {
        home-desktop = nixpkgs.lib.nixosSystem {
          system = system_1;
          modules = [ ./hosts/${hostname_1} ];
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
      # home-manager is wired up in modules/core/darwin/user.nix
      darwinConfigurations = {
        lysio-macbook = nix-darwin.lib.darwinSystem {
          system = system_2;
          modules = [ ./hosts/${hostname_2} ];
          specialArgs = {
            hostname = hostname_2;
            system = system_2;
            inherit inputs username user_info;
          };
        };
      };
    };
}
