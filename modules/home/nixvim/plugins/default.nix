{
  imports = [
  	./lsp
	./barbar.nix
	./conform-nvim.nix
	./coq-nvim.nix
  ./dashboard.nix
	./fidget.nix
	./fzf-lua.nix
	./harpoon.nix
	./inc-rename.nix
  ./indent-o-matic.nix
	./lualine.nix
	./mini.nix
  ./noice.nix
	./none-ls.nix
  ./nui.nix
	./nvim-bqf.nix
  ./persistence.nix
	./project-nvim.nix
	./scope.nix
  ./todo-comments.nix
	./toggleterm.nix
  ./trouble.nix
	./treesitter.nix
  ./snacks.nix
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

      colorizer = {
        enable = true;
        settings ={
          user_default_options.names = false;
        };
      };

      trim = {
        enable = true;
        settings = {
          highlight = false;
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
