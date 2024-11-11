{
  imports = [
  	./lsp
	./barbar.nix
	./conform-nvim.nix
	./coq-nvim.nix
	./fidget.nix
	./fzf-lua.nix
	./harpoon.nix
	./inc-rename.nix
    ./indent-o-matic.nix
	./lazygit.nix
	./lualine.nix
	./mini.nix
	./none-ls.nix
	./nvim-bqf.nix
	./project-nvim.nix
	./scope.nix
    ./startup.nix
	./toggleterm.nix
	./treesitter.nix
	./vimtex.nix
    ./which-key.nix
	./yanky.nix
	./yazi.nix
  ];

  programs.nixvim = {
    colorschemes.gruvbox.enable = true;

    plugins = {
      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "lspinfo"
            "neo-tree"
          ];
        };
      };
    };
  };
}
