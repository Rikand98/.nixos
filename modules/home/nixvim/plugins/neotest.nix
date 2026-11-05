{
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = {
      python.enable = true;
      testthat.enable = true;
      zig.enable = true;
    };
    settings = {
      output = {
        enabled = true;
        open_on_run = true;
      };
      quickfix.enabled = false;
    };
  };
}
