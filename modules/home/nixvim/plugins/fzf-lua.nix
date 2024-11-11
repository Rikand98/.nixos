{
  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;
    };
    keymaps = [
    # fzf-lua Keymaps
    {
      mode = ["n"];
      key = "<leader><space>";
      action = "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Find Files (Root Dir)"; };
    }
    {
      mode = ["n"];
      key = "<leader>,";
      action = "<cmd>lua require('fzf-lua').buffers()<CR>";
      options = { silent = true; desc = "Switch Buffer"; };
    }
    {
      mode = ["n"];
      key = "<leader>/";
      action = "<cmd>lua require('fzf-lua').grep_cword({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Grep (Root Dir)"; };
    }
    {
      mode = ["n"];
      key = "<leader>:";
      action = "<cmd>lua require('fzf-lua').commands_history()<CR>";
      options = { silent = true; desc = "Command History"; };
    }
    {
      mode = ["n"];
      key = "<leader>fb";
      action = "<cmd>lua require('fzf-lua').buffers()<CR>";
      options = { silent = true; desc = "Buffers"; };
    }
    {
      mode = ["n"];
      key = "<leader>fc";
      action = "<cmd>lua require('fzf-lua').find_config_files()<CR>";
      options = { silent = true; desc = "Find Config File"; };
    }
    {
      mode = ["n"];
      key = "<leader>ff";
      action = "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Find Files (Root Dir)"; };
    }
    {
      mode = ["n"];
      key = "<leader>fF";
      action = "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Find Files (cwd)"; };
    }
    {
      mode = ["n"];
      key = "<leader>fg";
      action = "<cmd>lua require('fzf-lua').git_files()<CR>";
      options = { silent = true; desc = "Find Files (git-files)"; };
    }
    {
      mode = ["n"];
      key = "<leader>fr";
      action = "<cmd>lua require('fzf-lua').recent_files()<CR>";
      options = { silent = true; desc = "Recent"; };
    }
    {
      mode = ["n"];
      key = "<leader>fR";
      action = "<cmd>lua require('fzf-lua').recent_files({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Recent (cwd)"; };
    }
    {
      mode = ["n"];
      key = "<leader>gc";
      action = "<cmd>lua require('fzf-lua').git_commits()<CR>";
      options = { silent = true; desc = "Commits"; };
    }
    {
      mode = ["n"];
      key = "<leader>gs";
      action = "<cmd>lua require('fzf-lua').git_status()<CR>";
      options = { silent = true; desc = "Status"; };
    }
    {
      mode = ["n"];
      key = "<leader>s\"";
      action = "<cmd>lua require('fzf-lua').registers()<CR>";
      options = { silent = true; desc = "Registers"; };
    }
    {
      mode = ["n"];
      key = "<leader>sa";
      action = "<cmd>lua require('fzf-lua').autocommands()<CR>";
      options = { silent = true; desc = "Auto Commands"; };
    }
    {
      mode = ["n"];
      key = "<leader>sb";
      action = "<cmd>lua require('fzf-lua').buffers()<CR>";
      options = { silent = true; desc = "Buffer"; };
    }
    {
      mode = ["n"];
      key = "<leader>sc";
      action = "<cmd>lua require('fzf-lua').commands_history()<CR>";
      options = { silent = true; desc = "Command History"; };
    }
    {
      mode = ["n"];
      key = "<leader>sC";
      action = "<cmd>lua require('fzf-lua').commands()<CR>";
      options = { silent = true; desc = "Commands"; };
    }
    {
      mode = ["n"];
      key = "<leader>sd";
      action = "<cmd>lua require('fzf-lua').document_diagnostics()<CR>";
      options = { silent = true; desc = "Document Diagnostics"; };
    }
    {
      mode = ["n"];
      key = "<leader>sD";
      action = "<cmd>lua require('fzf-lua').workspace_diagnostics()<CR>";
      options = { silent = true; desc = "Workspace Diagnostics"; };
    }
    {
      mode = ["n"];
      key = "<leader>sg";
      action = "<cmd>lua require('fzf-lua').grep({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Grep (Root Dir)"; };
    }
    {
      mode = ["n"];
      key = "<leader>sG";
      action = "<cmd>lua require('fzf-lua').grep({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Grep (cwd)"; };
    }
    {
      mode = ["n"];
      key = "<leader>sh";
      action = "<cmd>lua require('fzf-lua').help_pages()<CR>";
      options = { silent = true; desc = "Help Pages"; };
    }
    {
      mode = ["n"];
      key = "<leader>sH";
      action = "<cmd>lua require('fzf-lua').search_highlight_groups()<CR>";
      options = { silent = true; desc = "Search Highlight Groups"; };
    }
    {
      mode = ["n"];
      key = "<leader>sj";
      action = "<cmd>lua require('fzf-lua').jumplist()<CR>";
      options = { silent = true; desc = "Jumplist"; };
    }
    {
      mode = ["n"];
      key = "<leader>sk";
      action = "<cmd>lua require('fzf-lua').keymaps()<CR>";
      options = { silent = true; desc = "Key Maps"; };
    }
    {
      mode = ["n"];
      key = "<leader>sl";
      action = "<cmd>lua require('fzf-lua').location_list()<CR>";
      options = { silent = true; desc = "Location List"; };
    }
    {
      mode = ["n"];
      key = "<leader>sm";
      action = "<cmd>lua require('fzf-lua').marks()<CR>";
      options = { silent = true; desc = "Jump to Mark"; };
    }
    {
      mode = ["n"];
      key = "<leader>sM";
      action = "<cmd>lua require('fzf-lua').manpages()<CR>";
      options = { silent = true; desc = "Man Pages"; };
    }
    {
      mode = ["n"];
      key = "<leader>sq";
      action = "<cmd>lua require('fzf-lua').quickfix_list()<CR>";
      options = { silent = true; desc = "Quickfix List"; };
    }
    {
      mode = ["n"];
      key = "<leader>sR";
      action = "<cmd>lua require('fzf-lua').resume()<CR>";
      options = { silent = true; desc = "Resume"; };
    }
    {
      mode = ["n"];
      key = "<leader>ss";
      action = "<cmd>lua require('fzf-lua').symbols()<CR>";
      options = { silent = true; desc = "Goto Symbol"; };
    }
    {
      mode = ["n"];
      key = "<leader>sS";
      action = "<cmd>lua require('fzf-lua').workspace_symbols()<CR>";
      options = { silent = true; desc = "Goto Symbol (Workspace)"; };
    }
    {
      mode = ["n"];
      key = "<leader>sw";
      action = "<cmd>lua require('fzf-lua').word({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Word (Root Dir)"; };
    }
    {
      mode = ["n"];
      key = "<leader>sW";
      action = "<cmd>lua require('fzf-lua').word({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Word (cwd)"; };
    }
    {
      mode = ["v"];
      key = "<leader>sw";
      action = "<cmd>lua require('fzf-lua').selection({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Selection (Root Dir)"; };
    }
    {
      mode = ["v"];
      key = "<leader>sW";
      action = "<cmd>lua require('fzf-lua').selection({ cwd = vim.fn.getcwd() })<CR>";
      options = { silent = true; desc = "Selection (cwd)"; };
    }
    {
      mode = ["n"];
      key = "<leader>uC";
      action = "<cmd>lua require('fzf-lua').colorscheme_preview()<CR>";
      options = { silent = true; desc = "Colorscheme with Preview"; };
    }
  ];
  };
}
