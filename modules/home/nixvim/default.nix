{inputs,...}: 
{	
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./plugins
		./keymaps.nix
		./options.nix
		./todo.nix
	];
	home.shellAliases.v="nvim";
	
	programs.nixvim={
		enable = true;
		defaultEditor = true;
		colorschemes.gruvbox.enable = true;
	};
	# performance = {
	#       combinePlugins = {
	# 	enable = true;
	# 	standalonePlugins = [
	# 	  "hmts.nvim"
	# 	  "neorg"
	# 	  "nvim-treesitter"
	# 	];
	#       };
	#       byteCompileLua.enable = true;
	#     };
	#
	#     viAlias = true;
	#     vimAlias = true;

	    # luaLoader.enable = true;

}
