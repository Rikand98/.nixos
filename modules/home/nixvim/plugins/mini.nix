{ pkgs, ... }:
{
  programs.nixvim = {
  	plugins.mini = {
		enable = true;
		modules = {
			bracketed;
			hipatterns;
			indentscope;
			notify;
			pairs;
			surround;
		};

	};
  };
}

