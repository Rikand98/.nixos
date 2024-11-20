{
  programs.nixvim = {
  	plugins.snacks = {
		enable = true;
		settings = {
      bigfile = {
        enabled = true;
      };
      bufdelete = {
          enabled = false;
        };
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      quickfile = {
        enabled = true;
      };
      statuscolumn = {
        enabled = true;
      };
      terminal = {
          enabled = false;
        };
      words = {
        debounce = 100;
        enabled = true;
      };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>un";
        action = { __raw = "function() Snacks.notifier.hide() end"; };
        options = {
          desc = "Dismiss All Notifications";
        };
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = { __raw = "function() Snacks.lazygit() end"; };
        options = {
          desc = "Lazygit";
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = { __raw = "function() Snacks.git.blame_line() end"; };
        options = {
          desc = "Git Blame Line";
        };
      }
      {
        mode = "n";
        key = "<leader>gB";
        action = { __raw = "function() Snacks.gitbrowse() end"; };
        options = {
          desc = "Git Browse";
        };
      }
      {
        mode = "n";
        key = "<leader>gf";
        action = { __raw = "function() Snacks.lazygit.log_file() end"; };
        options = {
          desc = "Lazygit Current File History";
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = { __raw = "function() Snacks.lazygit.log() end"; };
        options = {
          desc = "Lazygit Log (cwd)";
        };
      }
      {
        mode = "n";
        key = "<leader>cR";
        action = { __raw = "function() Snacks.rename.rename_file() end"; };
        options = {
          desc = "Rename File";
        };
      }
      {
        mode = [ "n" "t" ];
        key = "]]";
        action = { __raw = "function() Snacks.words.jump(vim.v.count1) end"; };
        options = {
          desc = "Next Reference";
        };
      }
      {
        mode = [ "n" "t" ];
        key = "[[";
        action = { __raw = "function() Snacks.words.jump(-vim.v.count1) end"; };
        options = {
          desc = "Prev Reference";
        };
      }
      {
        mode = ["n"];
        key = "<A-n>";
        action = { __raw = "function() Snacks.words.jump(vim.v.count1, true) end"; };
        options = { nowait = true; silent = true; desc = "Next Reference"; };
      }
      {
        mode = ["n"];
        key = "<A-p>";
        action = { __raw = "function() Snacks.words.jump(-vim.v.count1, true) end"; };
        options = { nowait = true; silent = true; desc = "Prev Reference"; };
      }
    ];
	};
}
