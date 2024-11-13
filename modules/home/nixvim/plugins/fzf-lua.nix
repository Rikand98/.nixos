{
  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;
    };
    keymaps = [
    {
      mode = ["n"];
      key = "<leader>,";
      action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
      options = {
        desc = "Switch Buffer";
      };
    }
    {
      mode = ["n"];
      key = "<leader>/";
      action = "<cmd>lua require('fzf-lua').live_grep({ cwd = '/'})<cr>";
      options = {
        desc = "Grep (Root Dir)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>:";
      action = "<cmd>FzfLua command_history<cr>";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = ["n"];
      key = "<leader><space>";
      action = "<cmd>lua require('fzf-lua').files({ cwd = '/'})<cr>";
      options = {
        desc = "Find Files (Root Dir)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>fb";
      action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = ["n"];
      key = "<leader>ff";
      action = "<cmd>lua require('fzf-lua').files({ cwd = '/'})<cr>";
      options = {
        desc = "Find Files (Root Dir)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>fF";
      action = "<cmd>FzfLua files<cr>";
      options = {
        desc = "Find Files (cwd)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>fg";
      action = "<cmd>FzfLua git_files<cr>";
      options = {
        desc = "Find Files (git-files)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>fr";
      action = "<cmd>lua require('fzf-lua').oldfiles({ cwd = '/'})<cr>";
      options = {
        desc = "Recent";
      };
    }
    {
      mode = ["n"];
      key = "<leader>fR";
      action = "<cmd>FzfLua oldfiles<cr>";
      options = {
        desc = "Recent (cwd)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>gc";
      action = "<cmd>FzfLua git_commits<CR>";
      options = {
        desc = "Commits";
      };
    }
    {
      mode = ["n"];
      key = "<leader>gs";
      action = "<cmd>FzfLua git_status<CR>";
      options = {
        desc = "Status";
      };
    }
    {
      mode = ["n"];
      key = "<leader>s\"";
      action = "<cmd>FzfLua registers<cr>";
      options = {
        desc = "Registers";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sa";
      action = "<cmd>FzfLua autocmds<cr>";
      options = {
        desc = "Auto Commands";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sb";
      action = "<cmd>FzfLua grep_curbuf<cr>";
      options = {
        desc = "Buffer";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sc";
      action = "<cmd>FzfLua command_history<cr>";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sC";
      action = "<cmd>FzfLua commands<cr>";
      options = {
        desc = "Commands";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sd";
      action = "<cmd>FzfLua diagnostics_document<cr>";
      options = {
        desc = "Document Diagnostics";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sD";
      action = "<cmd>FzfLua diagnostics_workspace<cr>";
      options = {
        desc = "Workspace Diagnostics";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sg";
      action = "<cmd>lua require('fzf-lua').live_grep({ cwd = '/'})<cr>";
      options = {
        desc = "Grep (Root Dir)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sG";
      action = "<cmd>FzfLua live_grep<cr>";
      options = {
        desc = "Grep (cwd)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sh";
      action = "<cmd>FzfLua help_tags<cr>";
      options = {
        desc = "Help Pages";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sH";
      action = "<cmd>FzfLua highlights<cr>";
      options = {
        desc = "Search Highlight Groups";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sj";
      action = "<cmd>FzfLua jumps<cr>";
      options = {
        desc = "Jumplist";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sk";
      action = "<cmd>FzfLua keymaps<cr>";
      options = {
        desc = "Key Maps";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sl";
      action = "<cmd>FzfLua loclist<cr>";
      options = {
        desc = "Location List";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sM";
      action = "<cmd>FzfLua man_pages<cr>";
      options = {
        desc = "Man Pages";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sm";
      action = "<cmd>FzfLua marks<cr>";
      options = {
        desc = "Jump to Mark";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sR";
      action = "<cmd>FzfLua resume<cr>";
      options = {
        desc = "Resume";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sq";
      action = "<cmd>FzfLua quickfix<cr>";
      options = {
        desc = "Quickfix List";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sw";
      action = "<cmd>lua require('fzf-lua').grep_cword({ cwd = '/'})<cr>";
      options = {
        desc = "Word (Root Dir)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sW";
      action = "<cmd>FzfLua grep_cword<cr>";
      options = {
        desc = "Word (cwd)";
      };
    }
    {
      mode = ["v"];
      key = "<leader>sw";
      action = "<cmd>lua require('fzf-lua').grep_visual({ cwd = '/'})<cr>";
      options = {
        desc = "Selection (Root Dir)";
      };
    }
    {
      mode = ["v"];
      key = "<leader>sW";
      action = "<cmd>FzfLua grep_visual<cr>";
      options = {
        desc = "Selection (cwd)";
      };
    }
    {
      mode = ["n"];
      key = "<leader>uC";
      action = "<cmd>FzfLua colorschemes<cr>";
      options = {
        desc = "Colorscheme with Preview";
      };
    }
    {
      mode = ["n"];
      key = "<leader>ss";
      action = "lua function()
        require(fzf-lua).lsp_document_symbols({
          regex_filter = symbols_filter,
        })
      end";
      options = {
        desc = "Goto Symbol";
      };
    }
    {
      mode = ["n"];
      key = "<leader>sS";
      action = "lua function()
        require(fzf-lua).lsp_live_workspace_symbols({
          regex_filter = symbols_filter,
        })
      end";
      options = {
        desc = "Goto Symbol (Workspace)";
      };
    }
    {
      mode = ["n"];
      key = "gd";
      action = "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>";
      options = {
        desc = "Goto Definition";
    };
    }
    {
      mode = ["n"];
      key = "gr";
      action = "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>";
      options = {
        desc = "References";
        nowait = true;
      };
    }
    {
      mode = ["n"];
      key = "gI";
      action = "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>";
      options = {
        desc = "Goto Implementation";
      };
    }
    {
      mode = ["n"];
      key = "gy";
      action = "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>";
      options = {
        desc = "Goto T[y]pe Definition";
      };
    }
  ];
  };
}
