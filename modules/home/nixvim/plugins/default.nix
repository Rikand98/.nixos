{
  imports = [
  	./lsp
	./barbar.nix
	./fzf-lua.nix
	./harpoon.nix
	./markdown-preview.nix
	./mini-animate.nix
	./mini-completion.nix
	./mini-files.nix
	./mini-hipatterns.nix
	./mini-indentscope.nix
	./mini-pairs.nix
	./mini-surroun.nix
	./nvim-bqf.nix
	./prettier.nix
	./project.nix
	./toggleterm.nix
	./treesitter.nix
	./vim-doge.nix
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
