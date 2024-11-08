{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        dartls = {
          enable = true;
        };
      };
    };
  };
}
