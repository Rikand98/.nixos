{
  programs.nixvim.keymaps = [
    # Formatting
    {
      mode = [ "n" "x" ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      options.desc = "Format";
    }
    {
      mode = [ "n" ];
      key = "<leader>uf";
      action = "<cmd>FormatToggle<CR>";
      options.desc = "Toggle Autoformat (Global)";
    }
    {
      mode = [ "n" ];
      key = "<leader>uF";
      action = "<cmd>FormatToggle!<CR>";
      options.desc = "Toggle Autoformat (Buffer)";
    }

    # Buffers
    {
      mode = [ "n" ];
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Prev Buffer";
    }
    {
      mode = [ "n" ];
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Next Buffer";
    }
    {
      mode = [ "n" ];
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Prev Buffer";
    }
    {
      mode = [ "n" ];
      key = "]b";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Next Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bb";
      action = "<cmd>e #<CR>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bd";
      action.__raw = "function() Snacks.bufdelete() end";
      options.desc = "Delete Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bo";
      action.__raw = "function() Snacks.bufdelete.other() end";
      options.desc = "Delete Other Buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>bi";
      action.__raw = "function() Snacks.bufdelete.invisible() end";
      options.desc = "Delete Invisible Buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>bD";
      action = "<cmd>bd<CR>";
      options.desc = "Delete Buffer and Window";
    }
    {
      mode = [ "n" ];
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<CR>";
      options.desc = "Toggle Pin";
    }
    {
      mode = [ "n" ];
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<CR>";
      options.desc = "Delete Buffers to the Right";
    }
    {
      mode = [ "n" ];
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<CR>";
      options.desc = "Delete Buffers to the Left";
    }
    {
      mode = [ "n" ];
      key = "<leader>bj";
      action = "<cmd>BufferLinePick<CR>";
      options.desc = "Pick Buffer";
    }

    # Debug
    {
      mode = [ "n" ];
      key = "<leader>dB";
      action.__raw = "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end";
      options.desc = "Breakpoint Condition";
    }
    {
      mode = [ "n" ];
      key = "<leader>db";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options.desc = "Toggle Breakpoint";
    }
    {
      mode = [ "n" ];
      key = "<leader>dc";
      action.__raw = "function() require('dap').continue() end";
      options.desc = "Run/Continue";
    }
    {
      mode = [ "n" ];
      key = "<leader>dC";
      action.__raw = "function() require('dap').run_to_cursor() end";
      options.desc = "Run to Cursor";
    }
    {
      mode = [ "n" ];
      key = "<leader>dg";
      action.__raw = "function() require('dap').goto_() end";
      options.desc = "Go to Line (No Execute)";
    }
    {
      mode = [ "n" ];
      key = "<leader>di";
      action.__raw = "function() require('dap').step_into() end";
      options.desc = "Step Into";
    }
    {
      mode = [ "n" ];
      key = "<leader>dj";
      action.__raw = "function() require('dap').down() end";
      options.desc = "Down";
    }
    {
      mode = [ "n" ];
      key = "<leader>dk";
      action.__raw = "function() require('dap').up() end";
      options.desc = "Up";
    }
    {
      mode = [ "n" ];
      key = "<leader>dl";
      action.__raw = "function() require('dap').run_last() end";
      options.desc = "Run Last";
    }
    {
      mode = [ "n" ];
      key = "<leader>do";
      action.__raw = "function() require('dap').step_out() end";
      options.desc = "Step Out";
    }
    {
      mode = [ "n" ];
      key = "<leader>dO";
      action.__raw = "function() require('dap').step_over() end";
      options.desc = "Step Over";
    }
    {
      mode = [ "n" ];
      key = "<leader>dP";
      action.__raw = "function() require('dap').pause() end";
      options.desc = "Pause";
    }
    {
      mode = [ "n" ];
      key = "<leader>dr";
      action.__raw = "function() require('dap').repl.toggle() end";
      options.desc = "Toggle REPL";
    }
    {
      mode = [ "n" ];
      key = "<leader>ds";
      action.__raw = "function() require('dap').session() end";
      options.desc = "Session";
    }
    {
      mode = [ "n" ];
      key = "<leader>dt";
      action.__raw = "function() require('dap').terminate() end";
      options.desc = "Terminate";
    }
    {
      mode = [ "n" ];
      key = "<leader>du";
      action = "<cmd>DapViewToggle<CR>";
      options.desc = "Debug View";
    }
    {
      mode = [ "n" ];
      key = "<leader>dw";
      action.__raw = "function() require('dap.ui.widgets').hover() end";
      options.desc = "Widgets";
    }

    # Tests
    {
      mode = [ "n" ];
      key = "<leader>ta";
      action.__raw = "function() require('neotest').run.attach() end";
      options.desc = "Attach to Test";
    }
    {
      mode = [ "n" ];
      key = "<leader>tt";
      action.__raw = "function() require('neotest').run.run(vim.fn.expand('%')) end";
      options.desc = "Run File";
    }
    {
      mode = [ "n" ];
      key = "<leader>tT";
      action.__raw = "function() require('neotest').run.run(vim.uv.cwd()) end";
      options.desc = "Run All Test Files";
    }
    {
      mode = [ "n" ];
      key = "<leader>tr";
      action.__raw = "function() require('neotest').run.run() end";
      options.desc = "Run Nearest";
    }
    {
      mode = [ "n" ];
      key = "<leader>tl";
      action.__raw = "function() require('neotest').run.run_last() end";
      options.desc = "Run Last";
    }
    {
      mode = [ "n" ];
      key = "<leader>ts";
      action.__raw = "function() require('neotest').summary.toggle() end";
      options.desc = "Toggle Summary";
    }
    {
      mode = [ "n" ];
      key = "<leader>to";
      action.__raw = "function() require('neotest').output.open({ enter = true, auto_close = true }) end";
      options.desc = "Show Output";
    }
    {
      mode = [ "n" ];
      key = "<leader>tO";
      action.__raw = "function() require('neotest').output_panel.toggle() end";
      options.desc = "Toggle Output Panel";
    }
    {
      mode = [ "n" ];
      key = "<leader>tS";
      action.__raw = "function() require('neotest').run.stop() end";
      options.desc = "Stop";
    }
    {
      mode = [ "n" ];
      key = "<leader>tw";
      action.__raw = "function() require('neotest').watch.toggle(vim.fn.expand('%')) end";
      options.desc = "Toggle Watch";
    }

    # Harpoon
    {
      mode = [ "n" ];
      key = "<leader>H";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "Harpoon File";
    }
    {
      mode = [ "n" ];
      key = "<leader>h";
      action.__raw = "function() local h = require('harpoon'); h.ui:toggle_quick_menu(h:list()) end";
      options.desc = "Harpoon Quick Menu";
    }
    {
      mode = [ "n" ];
      key = "<leader>1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Harpoon to File 1";
    }
    {
      mode = [ "n" ];
      key = "<leader>2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Harpoon to File 2";
    }
    {
      mode = [ "n" ];
      key = "<leader>3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Harpoon to File 3";
    }
    {
      mode = [ "n" ];
      key = "<leader>4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Harpoon to File 4";
    }
    {
      mode = [ "n" ];
      key = "<leader>5";
      action.__raw = "function() require('harpoon'):list():select(5) end";
      options.desc = "Harpoon to File 5";
    }
    {
      mode = [ "n" ];
      key = "<leader>6";
      action.__raw = "function() require('harpoon'):list():select(6) end";
      options.desc = "Harpoon to File 6";
    }
    {
      mode = [ "n" ];
      key = "<leader>7";
      action.__raw = "function() require('harpoon'):list():select(7) end";
      options.desc = "Harpoon to File 7";
    }
    {
      mode = [ "n" ];
      key = "<leader>8";
      action.__raw = "function() require('harpoon'):list():select(8) end";
      options.desc = "Harpoon to File 8";
    }
    {
      mode = [ "n" ];
      key = "<leader>9";
      action.__raw = "function() require('harpoon'):list():select(9) end";
      options.desc = "Harpoon to File 9";
    }

    # Misc
    {
      mode = [ "n" ];
      key = "<leader>D";
      action = "<cmd>DBUIToggle<CR>";
      options.desc = "Toggle DBUI";
    }
    {
      mode = [ "n" ];
      key = "<leader>qq";
      action = "<cmd>qa<CR>";
      options.desc = "Quit All";
    }
    {
      mode = [ "n" ];
      key = "<leader>ui";
      action = "<cmd>lua vim.show_pos()<CR>";
      options.desc = "Inspect Pos";
    }
    {
      mode = [ "n" ];
      key = "<leader>uI";
      action = "<cmd>lua vim.treesitter.inspect_tree()<CR>";
      options.desc = "Inspect Tree";
    }
    {
      mode = [ "n" ];
      key = "<leader>uA";
      action = "<cmd>lua vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0<CR>";
      options.desc = "Toggle Tabline";
    }
    {
      mode = [ "n" ];
      key = "<leader>k";
      action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
      options.desc = "Signature Help";
    }
  ];
}
