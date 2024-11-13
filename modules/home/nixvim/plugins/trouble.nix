{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options = {
          desc = "Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options = {
          desc = "Buffer Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>cs";
        action = "<cmd>Trouble symbols toggle<cr>";
        options = {
          desc = "Symbols (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>cS";
        action = "<cmd>Trouble lsp toggle<cr>";
        options = {
          desc = "LSP references/definitions/... (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xL";
        action = "<cmd>Trouble loclist toggle<cr>";
        options = {
          desc = "Location List (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xQ";
        action = "<cmd>Trouble qflist toggle<cr>";
        options = {
          desc = "Quickfix List (Trouble)";
        };
      }
    ];
  };
}
