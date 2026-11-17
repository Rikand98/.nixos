{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lsp.servers.r_language_server = {
      enable = true;
      package = null;
    };
    extraPackages = [
      (pkgs.rWrapper.override {
        packages = [ pkgs.rPackages.languageserver ];
      })
    ];
  };
}
