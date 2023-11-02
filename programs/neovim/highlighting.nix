{ pkgs, ... }:

{
  programs.neovim = with pkgs; {
    plugins = [ 
      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
}
