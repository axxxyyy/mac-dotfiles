{ config, pkgs, lib, ... }:

{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      iosevka
      (nerdfonts.override { fonts = [ "Iosevka" "CascadiaCode" ]; })
    ];
  };
}
