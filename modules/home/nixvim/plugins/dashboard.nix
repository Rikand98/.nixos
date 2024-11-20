{
    programs.nixvim = {
        plugins.dashboard = {
            enable = true;
            settings = {
              theme = "doom";
              config = {
                footer = [
                  "Neovim ❤️"
                ];
                header = [
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "
                  "██████╗░██╗██╗░░██╗░█████╗░███╗░░██╗██████╗░"
                  "██╔══██╗██║██║░██╔╝██╔══██╗████╗░██║██╔══██╗"
                  "██████╔╝██║█████═╝░███████║██╔██╗██║██║░░██║"
                  "██╔══██╗██║██╔═██╗░██╔══██║██║╚████║██║░░██║"
                  "██║░░██║██║██║░╚██╗██║░░██║██║░╚███║██████╔╝"
                  "╚═╝░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░"
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "
                  "                                            "

                ];
                center = [
                  {
                    action = {
                      __raw = "function(path) vim.cmd('FzfLua files') end";
                    };
                    desc = " Files";
                    icon = " ";
                    key = "f";
                  }
                  {
                    action = {
                      __raw = "function(path) vim.cmd('FzfLua oldfiles') end";
                    };
                    desc =" Recent Files";
                    icon = " ";
                    key = "r";
                  }
                  {
                    action = {
                        __raw = "require(\"persistence\").load()";
                        };
                    desc =" Restore Session";
                    icon = " ";
                    key = "s";
                  }
                  {
                    action = "Yazi";
                    desc =" Files";
                    icon = " ";
                    key = "e";
                  }
                  {
                    action = {
                      __raw = "function(path) vim.api.nvim_input('<cmd>qa<cr>')  end";
                    };
                    desc =" Quit";
                    icon = " ";
                    key = "q";
                  }
                ];
              };
            };
        };
    };
}
