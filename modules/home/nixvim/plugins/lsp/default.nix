{
  imports = [
 	./dart.nix
	./git.nix
	./json.nix
	./nix.nix
	./python.nix
	./rust.nix
	./tex.nix
	./toml.nix
	./yaml.nix
  ];

  programs.nixvim = {
    plugins = {
      # lsp-format = {
      #   enable = true;
      #   lspServersToEnable = "all";
      # };

      lsp = {
        enable = true;
          inlayHints = true;
      };
      };

     keymaps = [
    {
      mode = ["n"];
      key = "<leader>cl";
      action = "<cmd>LspInfo<CR>";
      options = { nowait = true;silent = true; desc = "LSP Info"; };
    }
    {
      mode = ["n"];
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
      options = { nowait = true; silent = true; desc = "Goto Declaration"; };
    }
    # {
    #   mode = ["n"];
    #   key = "K";
    #   action = {__raw = "vim.lsp.buf.hover()"; };
    #   options = { nowait = true; silent = true; desc = "Hover"; };
    # }
    {
      mode = ["n"];
      key = "gk";
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      options = { nowait = true; silent = true; desc = "Signature Help"; };
    }
    {
      mode = ["i"];
      key = "<C-k>";
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      options = { nowait = true; silent = true; desc = "Signature Help"; };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      options = { nowait = true; silent = true; desc = "Code Action"; };
    }
    {
      mode = ["n" "v"];
      key = "<leader>cc";
      action = "<cmd>lua vim.lsp.codelens.run()<cr>";
      options = { nowait = true; silent = true; desc = "Run Codelens"; };
    }
    {
      mode = ["n"];
      key = "<leader>cC";
      action = "<cmd>lua vim.lsp.codelens.refresh()<cr>";
      options = { nowait = true; silent = true; desc = "Refresh & Display Codelens"; };
    }
    {
      mode = ["n"];
      key = "<leader>cR";
      action = "<cmd>lua require('nvim-lspconfig').rename_file()<cr>";
      options = { nowait = true; silent = true; desc = "Rename File"; };
    }
    {
      mode = ["n"];
      key = "<leader>cr";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      options = { nowait = true; silent = true; desc = "Rename"; };
    }
    {
      mode = ["n"];
      key = "<leader>cA";
      action = "<cmd>lua vim.lsp.buf.execute_command()<cr>";
      options = { nowait = true; silent = true; desc = "Source Action"; };
    }
    #See more lsp related keybinds under snacks.nix and fzf-lua.nix
    ];
    };
}
