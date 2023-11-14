{ config, pkgs, lib, ... }:

{
  home-manager = { pkgs, config, ... }: {
    home.stateVersion = "23.05";
    home.packages = with pkgs; [
      neovim
      curl
      jq
      less
      eza
      gnupg
      pass
      gh
      coreutils
      mpv
      nodejs_20
      nodePackages.pnpm
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      nixpkgs-fmt
      nix-prefetch-git
      rustup
      qbittorrent
      ii
    ];

    imports = [
       #../../../programs/neovim
      ../../../programs/sketchybar
      ../../../programs/wallust.nix
      ./shell.nix
    ];

    home.file."Applications/home-manager".source =
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      "${apps}/Applications";
  };
}
