{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
    ./keymaps.nix
    ./keymaps-lazyvim.nix
    ./options.nix
  ];
  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox-material = {
      enable = true;
      settings = {
        background = "medium";
        foreground = "material";
        enable_italic = 0;
      };
    };
  };

}
