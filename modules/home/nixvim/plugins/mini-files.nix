{ pkgs, ... }:
{
  programs.nixvim = {
extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
        pname = "mini.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "echasnovski";
          repo = "mini.nvim";
          rev = "998cfcf1fdd0a6830d0fc35f1c054a6f55de1e7f"; 
          sha256 = "0ns5a3vinpy661v4dv5vldr8gpicxx4zfvzq0d9iyjr6pp0m40d0"; 
        };
      })
    ];
  };
}

