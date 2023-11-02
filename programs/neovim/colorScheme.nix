{ pkgs, ... }:

{
  programs.neovim = {
    plugins = [ 
      (pkgs.vimUtils.buildVimPlugin {
        name = "yawnc.nvim";
	src = pkgs.fetchFromGitHub {
	  owner = "sonjiku";
	  repo = "yawnc.nvim";
	  sha256 = "0f89m6gk2dwxivsq9v23s17dp0nagyr5icf9g69bnibg3qjmls60";
	  rev = "4a926d0023472ec308d212be6bc6e5d865af5d43";
	};
      })
    ];
    extraLuaConfig = ''
      vim.o.termguicolors = true
      vim.cmd.colorscheme("yawnc")
    '';
  };
}
