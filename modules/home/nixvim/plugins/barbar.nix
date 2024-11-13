{
  programs.nixvim = {
    plugins.barbar = {
    enable = true;
  };
  keymaps = [
      {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferPrevious<CR>";
      options = {
        silent = true;
        desc = "Prev Buffer";
      };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferNext<CR>";
      options = {
        silent = true;
        desc = "Next Buffer";
      };
    }
    {
      mode = "n";
      key = "<S-j>";
      action = "<cmd>BufferMovePrevious<CR>";
      options = {
        silent = true;
        desc = "Move Buffer Prev";
      };
    }
    {
      mode = "n";
      key = "<S-k>";
      action = "<cmd>BufferMoveNext<CR>";
      options = {
        silent = true;
        desc = "Move Buffer Next";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>BufferClose<CR>";
      options = {
        silent = true;
        desc = "Delete Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>bdelete<CR>";
      options = {
        silent = true;
        desc = "Delete Buffer and Window";
      };
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferRestore<CR>";
      options = {
        silent = true;
        desc = "Restore Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferPick<CR>";
      options = {
        silent = true;
        desc = "Pick Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<cmd>BufferPickDelete<CR>";
      options = {
        silent = true;
        desc = "Delete Pick Buffer";
      };
    }
    ];
};
}
