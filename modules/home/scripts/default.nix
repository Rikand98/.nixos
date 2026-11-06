{ pkgs, ... }:
let
  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  mic-toggle = pkgs.writeShellScriptBin "mic-toggle" (builtins.readFile ./scripts/mic-toggle.sh);
  lofi = pkgs.writeScriptBin "lofi" (builtins.readFile ./scripts/lofi.sh);

  toggle_waybar = pkgs.writeScriptBin "toggle_waybar" (builtins.readFile ./scripts/toggle_waybar.sh);

  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  vm-start = pkgs.writeScriptBin "vm-start" (builtins.readFile ./scripts/vm-start.sh);

  ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  power-menu = pkgs.writeScriptBin "power-menu" (builtins.readFile ./scripts/power-menu.sh);
  nixvim = pkgs.writeShellScriptBin "nixvim" (builtins.readFile ./scripts/nixvim.sh);
in
{
  home.packages = with pkgs; [
    runbg
    lofi

    toggle_waybar
    mic-toggle

    maxfetch

    compress
    extract

    vm-start

    ascii

    record

    power-menu

    nixvim

  ];
}
