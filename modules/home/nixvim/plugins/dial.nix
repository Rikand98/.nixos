{
  programs.nixvim = {
    plugins.dial.enable = true;

    extraConfigLua = ''
      function _G.lazyvim_dial(increment, g)
        local mode = vim.fn.mode(true)
        local is_visual = mode == "v" or mode == "V" or mode == "\22"
        local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
        local group = (vim.g.dials_by_ft and vim.g.dials_by_ft[vim.bo.filetype]) or "default"
        return require("dial.map")[func](group)
      end
    '';

    keymaps = [
      {
        mode = [ "n" "v" ];
        key = "<C-a>";
        action.__raw = "function() return _G.lazyvim_dial(true) end";
        options = {
          expr = true;
          desc = "Increment";
        };
      }
      {
        mode = [ "n" "v" ];
        key = "<C-x>";
        action.__raw = "function() return _G.lazyvim_dial(false) end";
        options = {
          expr = true;
          desc = "Decrement";
        };
      }
      {
        mode = [ "n" "x" ];
        key = "g<C-a>";
        action.__raw = "function() return _G.lazyvim_dial(true, true) end";
        options = {
          expr = true;
          desc = "Increment";
        };
      }
      {
        mode = [ "n" "x" ];
        key = "g<C-x>";
        action.__raw = "function() return _G.lazyvim_dial(false, true) end";
        options = {
          expr = true;
          desc = "Decrement";
        };
      }
    ];
  };
}
