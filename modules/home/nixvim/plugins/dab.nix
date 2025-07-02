{
  programs.nixvim = {
    plugins.dab = {
      enable = true;
      extensions = {
        dap-ui = {
          enable = true;
        };
        dap-virtual-text = {
          enable = false;
        };
      };
    };
  };
}
