{
  programs.nixvim = {
    plugins.yanky = {
      enable = true;
    };
keymaps = [
    # Yanky Keymaps
    {
      mode = ["n" "x"];
      key = "<leader>p";
      action = ":lua require('yanky').open_history()<CR>";
      options = { silent = true; desc = "Open Yank History"; };
    }
    {
      mode = ["n"];
      key = "<p";
      action = "put =1";
      options = { silent = true; desc = "Put and Indent Left"; };
    }
    {
      mode = ["n"];
      key = "<P";
      action = "put! =1";
      options = { silent = true; desc = "Put Before and Indent Left"; };
    }
    {
      mode = ["n"];
      key = "=p";
      action = "put =1 | filter!'";
      options = { silent = true; desc = "Put After Applying a Filter"; };
    }
    {
      mode = ["n"];
      key = "=P";
      action = "put! =1 | filter!'";
      options = { silent = true; desc = "Put Before Applying a Filter"; };
    }
    {
      mode = ["n"];
      key = ">p";
      action = "put =1";
      options = { silent = true; desc = "Put and Indent Right"; };
    }
    {
      mode = ["n"];
      key = ">P";
      action = "put! =1";
      options = { silent = true; desc = "Put Before and Indent Right"; };
    }
    {
      mode = ["n"];
      key = "[p";
      action = "put =1";
      options = { silent = true; desc = "Put Indented Before Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "[P";
      action = "put! =1";
      options = { silent = true; desc = "Put Indented Before Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "y";
      action = "yank";
      options = { silent = true; desc = "Cycle Forward Through Yank History"; };
    }
    {
      mode = ["n"];
      key = "]p";
      action = "put =1";
      options = { silent = true; desc = "Put Indented After Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "]P";
      action = "put! =1";
      options = { silent = true; desc = "Put Indented After Cursor (Linewise)"; };
    }
    {
      mode = ["n"];
      key = "]y";
      action = "yank";
      options = { silent = true; desc = "Cycle Backward Through Yank History"; };
    }
    {
      mode = ["n" "x"];
      key = "gp";
      action = "put =1";
      options = { silent = true; desc = "Put Text After Selection"; };
    }
    {
      mode = ["n" "x"];
      key = "gP";
      action = "put! =1";
      options = { silent = true; desc = "Put Text Before Selection"; };
    }
    {
      mode = ["n" "x"];
      key = "p";
      action = "put =1";
      options = { silent = true; desc = "Put Text After Cursor"; };
    }
    {
      mode = ["n" "x"];
      key = "P";
      action = "put! =1";
      options = { silent = true; desc = "Put Text Before Cursor"; };
    }
    {
      mode = ["n" "x"];
      key = "y";
      action = "yank";
      options = { silent = true; desc = "Yank Text"; };
    }
  ];
  };
}
