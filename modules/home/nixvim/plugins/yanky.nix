{
  programs.nixvim = {
    plugins.yanky = {
      enable = true;
      settings = {
        highlight = {
          on_put = true;
          on_yank = true;
          timer = 150;
        };
      };
    };
    keymaps = [
    # Yanky Keymaps
    {
      mode = ["n" "x"];
      key = "<leader>p";
      action.__raw = ''function() vim.cmd("YankyRingHistory") end'';
      options = { silent = true; desc = "Open Yank History"; };
    }
    {
      mode = ["n" "x"];
      key = "y";
      action = "<Plug>(YankyYank)";
      options = { silent = true; desc = "Yank Text"; };
    }
    {
      mode = ["n" "x"];
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options = { silent = true; desc = "Put Text After Cursor"; };
    }
    {
      mode = ["n" "x"];
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options = { silent = true; desc = "Put Text Before Cursor"; };
    }
    {
      mode = ["n" "x"];
      key = "gp";
      action = "<Plug>(YankyGPutAfter)";
      options = { silent = true; desc = "Put Text After Selection"; };
    }
    {
      mode = ["n" "x"];
      key = "gP";
      action = "<Plug>(YankyGPutBefore)";
      options = { silent = true; desc = "Put Text Before Selection"; };
    }
    {
      mode = ["n"];
      key = "[y";
      action = "<Plug>(YankyCycleForward)";
      options = { silent = true; desc = "Cycle Forward Through Yank History"; };
    }
    {
      mode = ["n"];
      key = "]y";
      action = "<Plug>(YankyCycleBackward)";
      options = { silent = true; desc = "Cycle Backward Through Yank History"; };
    }
    {
      mode = ["n"];
      key = "]p";
      action = "<Plug>(YankyPutIndentAfterLinewise)";
      options = { silent = true; desc = "Put Indented After Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "[p";
      action = "<Plug>(YankyPutIndentBeforeLinewise)";
      options = { silent = true; desc = "Put Indented Before Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "]P";
      action = "<Plug>(YankyPutIndentAfterLinewise)";
      options = { silent = true; desc = "Put Indented After Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "[P";
      action = "<Plug>(YankyPutIndentBeforeLinewise)";
      options = { silent = true; desc = "Put Indented Before Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = ">p";
      action = "<Plug>(YankyPutIndentAfterShiftRight)";
      options = { silent = true; desc = "Put and Indent Right"; };
    }
    {
      mode = ["n"];
      key = "<p";
      action = "<Plug>(YankyPutIndentAfterShiftLeft)";
      options = { silent = true; desc = "Put and Indent Left"; };
    }
    {
      mode = ["n"];
      key = ">P";
      action = "<Plug>(YankyPutIndentBeforeShiftRight)";
      options = { silent = true; desc = "Put Before and Indent Right"; };
    }
    {
      mode = ["n"];
      key = "<P";
      action = "<Plug>(YankyPutIndentBeforeShiftLeft)";
      options = { silent = true; desc = "Put Before and Indent Left"; };
    }
    {
      mode = ["n"];
      key = "=p";
      action = "<Plug>(YankyPutAfterFilter)";
      options = { silent = true; desc = "Put After Applying a Filter"; };
    }
    {
      mode = ["n"];
      key = "=P";
      action = "<Plug>(YankyPutBeforeFilter)";
      options = { silent = true; desc = "Put Before Applying a Filter"; };
    }
];

  };
}
