{inputs,...}:
{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./plugins
		./keymaps.nix
		./options.nix
	];
	home.shellAliases.v="nvim";

	programs.nixvim={
		enable = true;
		defaultEditor = true;
		colorschemes.gruvbox.enable = true;
	};


}
