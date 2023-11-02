{ pkgs, lib, ... }:

{
  imports = [
    ./colorScheme.nix
    ./highlighting.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
