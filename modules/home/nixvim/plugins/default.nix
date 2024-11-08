{
  imports = [
  	./lsp
	./barbar.nix
	./chatgpt.nix
	./fzf-lua.nix
	./harpoon.nix
	./inc-rename.nix
	./indent-o-matix.nix
	./lazygit.nix
	./lualine.nix
	./markdown-preview.nix
	./mini-files.nix
	./navic.nix
	./noice.nix
	./none-ls.nix
	./nvim-bqf.nix
	./nvim-sorround.nix
	./prettier.nix
	./project.nix
	./toggleterm.nix
	./treesitter.nix
	./vimtex.nix
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

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;

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
