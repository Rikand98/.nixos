{
  imports = [
    ./lsp
    ./blink-cmp.nix
    ./bufferline.nix
    ./conform-nvim.nix
    ./dashboard.nix
    ./dap.nix
    ./dial.nix
    ./fidget.nix
    ./fzf-lua.nix
    ./harpoon.nix
    ./indent-o-matic.nix
    ./lint.nix
    ./lualine.nix
    ./mini.nix
    ./neoconf.nix
    ./neotest.nix
    ./noice.nix
    ./nui.nix
    ./nvim-bqf.nix
    ./persistence.nix
    ./r-nvim.nix
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
        settings = {
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
