{ pkgs, ... }:
let
  wayland-ptt-fix = pkgs.stdenv.mkDerivation {
    pname = "wayland-push-to-talk-fix";
    version = "unstable-2024";

    src = pkgs.fetchFromGitHub {
      owner = "Rush";
      repo = "wayland-push-to-talk-fix";
      rev = "main";
      sha256 = "sha256-nvoeeOVBVm0GhTpsf8LkYUBXeRWDqdWuEO9FV8La13g="; # Updated with the correct hash for Rush/wayland-push-to-talk-fix
    };

    nativeBuildInputs = [
      pkgs.pkg-config
      pkgs.gnumake
      pkgs.gcc
    ];

    # Added xorg.libX11 here to fix the missing X11/Xlib.h compiler error
    buildInputs = [
      pkgs.libevdev
      pkgs.xdotool
      pkgs.xorg.libX11
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp push-to-talk $out/bin/
    '';
  };
in
{
  home.packages = with pkgs; [
    wayland-ptt-fix
  ];
}
