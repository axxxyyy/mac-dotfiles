{ config, pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Liga SFMono Nerd Font";
      font_size = "16.0";
    };
  };
}
