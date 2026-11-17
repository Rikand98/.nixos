{
  programs.nixvim.plugins.lint = {
    enable = true;
    # Without this the linters listed below are never installed, so linting
    # silently does nothing.
    autoInstall.enable = true;
    lintersByFt = {
      markdown = [ "markdownlint-cli2" ];
      sql = [ "sqlfluff" ];
    };
  };
}
