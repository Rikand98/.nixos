{
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      markdown = [ "markdownlint-cli2" ];
      sql = [ "sqlfluff" ];
    };
  };
}
