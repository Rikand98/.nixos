{
  plugins.lsp.servers = {
    texlab = {
      enable = true;
      settings = {
        latex = {
          build = {
            executable = "latexmk";
            args = [ "-pdf" "-interaction=nonstopmode" "-synctex=1" "%f" ];
          };
        };
      };
    };
    };
}

