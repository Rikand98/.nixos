{
  plugins.lsp.servers = {
    jsonls = {
      enable = true;
      settings = {
        json = {
          schemas = [
            {
              fileMatch = [ "*.json" ];
              url = "https://json.schemastore.org/schema.json";
            }
          ];
        };
      };
    };
  };
}
