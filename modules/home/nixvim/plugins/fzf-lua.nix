{
  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;
    };

    # LazyVim-style project root detection. `cwd=/` means the filesystem root,
    # not the project root, so use this helper for the "Root Dir" variants.
    extraConfigLua = ''
      function _G.lazyvim_root()
        return vim.fs.root(0, {
          ".git", "lua", "pyproject.toml", "package.json", "Cargo.toml",
          "go.mod", "build.zig", "pom.xml", "build.gradle", "DESCRIPTION",
        }) or vim.fn.getcwd()
      end
    '';

    keymaps = [
      {
        mode = [ "t" ];
        key = "<C-j>";
        action = "<C-j>";
      }
      {
        mode = [ "t" ];
        key = "<C-k>";
        action = "<C-k>";
      }
      {
        mode = [ "n" ];
        key = "<leader>,";
        action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Switch Buffer";
      }
      {
        mode = [ "n" ];
        key = "<leader>/";
        action.__raw = "function() require('fzf-lua').live_grep({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Grep (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>:";
        action = "<cmd>FzfLua command_history<cr>";
        options.desc = "Command History";
      }
      {
        mode = [ "n" ];
        key = "<leader><space>";
        action.__raw = "function() require('fzf-lua').files({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Find Files (Root Dir)";
      }

      # find
      {
        mode = [ "n" ];
        key = "<leader>fb";
        action = "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Buffers";
      }
      {
        mode = [ "n" ];
        key = "<leader>fB";
        action = "<cmd>FzfLua buffers<cr>";
        options.desc = "Buffers (all)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fc";
        action.__raw = "function() require('fzf-lua').files({ cwd = vim.fn.stdpath('config') }) end";
        options.desc = "Find Config File";
      }
      {
        mode = [ "n" ];
        key = "<leader>ff";
        action.__raw = "function() require('fzf-lua').files({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Find Files (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fF";
        action = "<cmd>FzfLua files<cr>";
        options.desc = "Find Files (cwd)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fg";
        action = "<cmd>FzfLua git_files<cr>";
        options.desc = "Find Files (git-files)";
      }
      {
        mode = [ "n" ];
        key = "<leader>fr";
        action = "<cmd>FzfLua oldfiles<cr>";
        options.desc = "Recent";
      }
      {
        mode = [ "n" ];
        key = "<leader>fR";
        action.__raw = "function() require('fzf-lua').oldfiles({ cwd = vim.uv.cwd() }) end";
        options.desc = "Recent (cwd)";
      }

      # git
      {
        mode = [ "n" ];
        key = "<leader>gc";
        action = "<cmd>FzfLua git_commits<CR>";
        options.desc = "Commits";
      }
      {
        mode = [ "n" ];
        key = "<leader>gs";
        action = "<cmd>FzfLua git_status<CR>";
        options.desc = "Status";
      }

      # search
      {
        mode = [ "n" ];
        key = "<leader>s\"";
        action = "<cmd>FzfLua registers<cr>";
        options.desc = "Registers";
      }
      {
        mode = [ "n" ];
        key = "<leader>s/";
        action = "<cmd>FzfLua search_history<cr>";
        options.desc = "Search History";
      }
      {
        mode = [ "n" ];
        key = "<leader>sa";
        action = "<cmd>FzfLua autocmds<cr>";
        options.desc = "Auto Commands";
      }
      {
        mode = [ "n" ];
        key = "<leader>sb";
        action = "<cmd>FzfLua lines<cr>";
        options.desc = "Buffer Lines";
      }
      {
        mode = [ "n" ];
        key = "<leader>sc";
        action = "<cmd>FzfLua command_history<cr>";
        options.desc = "Command History";
      }
      {
        mode = [ "n" ];
        key = "<leader>sC";
        action = "<cmd>FzfLua commands<cr>";
        options.desc = "Commands";
      }
      {
        mode = [ "n" ];
        key = "<leader>sd";
        action = "<cmd>FzfLua diagnostics_workspace<cr>";
        options.desc = "Workspace Diagnostics";
      }
      {
        mode = [ "n" ];
        key = "<leader>sD";
        action = "<cmd>FzfLua diagnostics_document<cr>";
        options.desc = "Buffer Diagnostics";
      }
      {
        mode = [ "n" ];
        key = "<leader>sg";
        action.__raw = "function() require('fzf-lua').live_grep({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Grep (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>sG";
        action = "<cmd>FzfLua live_grep<cr>";
        options.desc = "Grep (cwd)";
      }
      {
        mode = [ "n" ];
        key = "<leader>sh";
        action = "<cmd>FzfLua help_tags<cr>";
        options.desc = "Help Pages";
      }
      {
        mode = [ "n" ];
        key = "<leader>sH";
        action = "<cmd>FzfLua highlights<cr>";
        options.desc = "Search Highlight Groups";
      }
      {
        mode = [ "n" ];
        key = "<leader>sj";
        action = "<cmd>FzfLua jumps<cr>";
        options.desc = "Jumplist";
      }
      {
        mode = [ "n" ];
        key = "<leader>sk";
        action = "<cmd>FzfLua keymaps<cr>";
        options.desc = "Key Maps";
      }
      {
        mode = [ "n" ];
        key = "<leader>sl";
        action = "<cmd>FzfLua loclist<cr>";
        options.desc = "Location List";
      }
      {
        mode = [ "n" ];
        key = "<leader>sM";
        action = "<cmd>FzfLua man_pages<cr>";
        options.desc = "Man Pages";
      }
      {
        mode = [ "n" ];
        key = "<leader>sm";
        action = "<cmd>FzfLua marks<cr>";
        options.desc = "Jump to Mark";
      }
      {
        mode = [ "n" ];
        key = "<leader>sR";
        action = "<cmd>FzfLua resume<cr>";
        options.desc = "Resume";
      }
      {
        mode = [ "n" ];
        key = "<leader>sq";
        action = "<cmd>FzfLua quickfix<cr>";
        options.desc = "Quickfix List";
      }
      {
        mode = [ "n" ];
        key = "<leader>sw";
        action.__raw = "function() require('fzf-lua').grep_cword({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Word (Root Dir)";
      }
      {
        mode = [ "n" ];
        key = "<leader>sW";
        action = "<cmd>FzfLua grep_cword<cr>";
        options.desc = "Word (cwd)";
      }
      {
        mode = [ "v" ];
        key = "<leader>sw";
        action.__raw = "function() require('fzf-lua').grep_visual({ cwd = _G.lazyvim_root() }) end";
        options.desc = "Selection (Root Dir)";
      }
      {
        mode = [ "v" ];
        key = "<leader>sW";
        action = "<cmd>FzfLua grep_visual<cr>";
        options.desc = "Selection (cwd)";
      }

      # symbols / lsp
      {
        mode = [ "n" ];
        key = "<leader>ss";
        action = "<cmd>FzfLua lsp_document_symbols<cr>";
        options.desc = "Goto Symbol";
      }
      {
        mode = [ "n" ];
        key = "<leader>sS";
        action = "<cmd>FzfLua lsp_live_workspace_symbols<cr>";
        options.desc = "Goto Symbol (Workspace)";
      }
      {
        mode = [ "n" ];
        key = "gd";
        action = "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>";
        options.desc = "Goto Definition";
      }
      {
        mode = [ "n" ];
        key = "gr";
        action = "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>";
        options = {
          desc = "References";
          nowait = true;
        };
      }
      {
        mode = [ "n" ];
        key = "gI";
        action = "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>";
        options.desc = "Goto Implementation";
      }
      {
        mode = [ "n" ];
        key = "gy";
        action = "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>";
        options.desc = "Goto T[y]pe Definition";
      }

      # ui
      {
        mode = [ "n" ];
        key = "<leader>uC";
        action = "<cmd>FzfLua colorschemes<cr>";
        options.desc = "Colorscheme with Preview";
      }
    ];
  };
}
