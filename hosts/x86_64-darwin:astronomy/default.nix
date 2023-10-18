{ config, pkgs, lib, ... }@inputs:
let
  users = {
    axyie = import (./user + ":axyie") inputs;
  };
  forAll = m:
    map (username: { "${username}" = m username users.${username}; })
      (builtins.attrNames users);
  getUsers = lib.attrsets.mergeAttrsList (forAll (username: imported: {
    shell = pkgs.zsh;
    description = "${username}";
    home = "/Users/${username}";
  }));
  getHomeUsers = lib.attrsets.mergeAttrsList (forAll (username: imported:
    imported.home-manager));
in
{
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    auto-optimise-store = true
  '';
  users.users = getUsers;
  home-manager.users = getHomeUsers;

  # -- Dock
  system.defaults.dock = {
    autohide = false;
    show-recents = false;
  };
}
