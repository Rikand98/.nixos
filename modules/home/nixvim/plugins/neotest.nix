{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.neotest = {
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

    # The adapters above are Lua-only; these are the runners they shell out to.
    extraPackages = with pkgs; [
      (python3.withPackages (ps: [ ps.pytest ]))
      rPackages.testthat
    ];
  };
}
