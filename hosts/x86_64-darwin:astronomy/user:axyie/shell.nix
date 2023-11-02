{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza";
      nix-rebuild = "~/.config/nix/result/sw/bin/darwin-rebuild switch --flake ~/.config/nix";
    };
  };
  programs.zoxide.enable = true;
  home.sessionVariables = {
    PAGER = "less";
    EDITOR = "nvim";
  };
}
