{
    programs.nixvim = {
        plugins.dashboard = {
            enable = true;
            settings = {
              change_to_vcs_root = true;
              config = {
                footer = [
                  "Neovim ❤️"
                ];
                header = [
                  "██████╗░██╗██╗░░██╗░█████╗░███╗░░██╗██████╗░"
                  "██╔══██╗██║██║░██╔╝██╔══██╗████╗░██║██╔══██╗"
                  "██████╔╝██║█████═╝░███████║██╔██╗██║██║░░██║"
                  "██╔══██╗██║██╔═██╗░██╔══██║██║╚████║██║░░██║"
                  "██║░░██║██║██║░╚██╗██║░░██║██║░╚███║██████╔╝"
                  "╚═╝░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░"
                ];
                mru = {
                  limit = 20;
                };
                project = {
                  enable = false;
                };
                shortcut = [
                  {
                    action = {
                      __raw = "function(path) vim.cmd('FzfLua files') end";
                    };
                    desc = " Files";
                    group = "Label";
                    icon = "";
                    icon_hl = "@variable";
                    key = "f";
                  }
                  {
                    action = {
                      __raw = "function(path) vim.cmd('FzfLua oldfiles') end";
                    };
                    desc ="Recent Files";
                    icon = "";
                    icon_hl = "@variable";
                    group = "Label";
                    key = "r";
                  }
                  {
                    action = {
                      __raw = "function() require('persistence').load({ last = true }) end";
                    };
                    desc ="Restore Session";
                    icon = "";
                    key = "s";
                  }
                  {
                    action = "Yazi";
                    desc ="Files";
                    icon = "";
                    key = "e";
                  }
                  {
                    action = {
                      __raw = "function(path) vim.api.nvim_input('<cmd>qa<cr>')  end";
                    };
                    desc ="Quit";
                    icon = "";
                    key = "q";
                  }
                ];
                week_header = {
                  enable = true;
                };
              };
              theme = "hyper";
            };
        };
    };
}
