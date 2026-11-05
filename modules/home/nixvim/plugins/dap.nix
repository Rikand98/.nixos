{
  programs.nixvim.plugins = {
    dap.enable = true;
    dap-view = {
      enable = true;
      settings.windows = {
        position = "right";
        size = 0.5;
        terminal = {
          position = "left";
          size = 0.5;
        };
      };
    };
    dap-virtual-text.enable = true;
    dap-python.enable = true;
  };
}
