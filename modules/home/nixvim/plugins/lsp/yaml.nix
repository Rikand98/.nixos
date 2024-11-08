{
  plugins.lsp.servers = {
    yamlls = {
      enable = true;
      settings = {
        yaml = {
          schemas = {
            "https://json.schemastore.org/github-workflow.json" = "/.github/workflows/*";
          };
        };
      };
    };
  };
}
