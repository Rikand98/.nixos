{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lsp.servers.r_language_server.enable = true;
    extraPackages = [
      (pkgs.rWrapper.override {
        packages = [ pkgs.rPackages.languageserver ];
      })
    ];
  };
}
