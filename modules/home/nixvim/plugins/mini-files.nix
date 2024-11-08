{
  programs.nixvim = {
   plugins.extra = [
	  {
	    pname = "mini.nvim";
	    src = pkgs.fetchFromGitHub {
	      owner = "echasnovski";
	      repo = "mini.nvim";
	      rev = "latest";
	      sha256 = lib.fakeSha256;  # Temporary value
	    };
	  }
	];
  };
}
