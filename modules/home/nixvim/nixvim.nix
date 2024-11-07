{inputs,...}: 
{	
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
	];
	home.shellAliases.v="nvim";
	
	programs.nixvim={
		enable = true;
		defaultEditor = true;
	};
}
