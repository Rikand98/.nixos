{
  programs.nixvim = {
  	plugins.mini = {
		enable = true;
		modules = {
			bracketed = {};
			# hipatterns default-highlight TODO/FIXME, overlapping todo-comments;
			# keep it only for hex colours.
			hipatterns = {
				highlighter = {
					hex = {};
				};
			};
			indentscope = {};
			pairs = {};
			surround = {};
		};

	};
  };
}
