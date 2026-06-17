{ pkgs, ... }:
let
  # Build the wayland-push-to-talk-fix binary from source
  wayland-ptt-fix = pkgs.stdenv.mkDerivation {
    pname = "wayland-push-to-talk-fix";
    version = "unstable-2024";

    src = pkgs.fetchFromGitHub {
      owner = "Rush";
      repo = "wayland-push-to-talk-fix";
      rev = "main"; # Or a specific commit hash if you prefer
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Run rebuilding once, Nix will tell you the correct hash!
    };

    nativeBuildInputs = [
      pkgs.pkg-config
      pkgs.gnumake
      pkgs.gcc
    ];
    buildInputs = [
      pkgs.libevdev
      pkgs.xdotool
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp push-to-talk $out/bin/
    '';
  };
in
{
  home.packages = with pkgs; [
    vesktop
    wayland-ptt-fix # Installs your freshly built binary
  ];
}
