{
  programs.nixvim.plugins.startup = {
    enable = true;

    colors = {
      # background = "#ffffff";
      # foldedSection = "#ffffff";
    };

    sections = {
      header = {
        type = "text";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Header";
        margin = 5;
        content = [
          "██████╗░██╗██╗░░██╗░█████╗░███╗░░██╗██████╗░"
          "██╔══██╗██║██║░██╔╝██╔══██╗████╗░██║██╔══██╗"
          "██████╔╝██║█████═╝░███████║██╔██╗██║██║░░██║"
          "██╔══██╗██║██╔═██╗░██╔══██║██║╚████║██║░░██║"
          "██║░░██║██║██║░╚██╗██║░░██║██║░╚███║██████╔╝"
          "╚═╝░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░"
        ];
        highlight = "Statement";
        defaultColor = "";
        oldfilesAmount = 0;
      };

      body = {
        type = "mapping";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Menu";
        margin = 5;
        content = [
          [
            " Find File"
            "lua require('fzf-lua').files({ cwd = vim.fn.getcwd() })"
            "f"
          ]
          [
            " Recent Files"
            "lua require('fzf-lua').resume()"
            "r"
          ]
          [
            " File Browser"
            "Yazi"
            "e"
          ]
          [
            "X Quit"
            "q"
            "q"
          ]
        ];
        highlight = "string";
        defaultColor = "";
        oldfilesAmount = 0;
      };
    };

    options = {
      paddings = [1 3];
    };

    parts = [
      "header"
      "body"
    ];
  };
}
