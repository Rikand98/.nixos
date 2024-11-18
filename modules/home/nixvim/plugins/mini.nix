{
  programs.nixvim = {
  	plugins.mini = {
		enable = true;
		modules = {
			bracketed = {};
			hipatterns = {};
      icons = {};
			indentscope = {};
			pairs = {};
			surround = {};
		};

	};
  };
}
