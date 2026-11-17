{
  imports = [
    ./dev.nix
    ./terminal.nix
    ./utilities.nix
    # Desktop apps are gated to Linux inside gui.nix (see below).
    ./gui.nix
  ];
}
