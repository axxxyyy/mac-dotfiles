{ config, pkgs, lib, ... }:

{
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    taps = [
      # appearance
      "shaunsingh/SFMono-Nerd-Font-Ligaturized"
      "homebrew/cask-fonts"
      "FelixKratz/formulae"
    ];
    casks = [
      # development toolkits
      "temurin"

      # productivity workflows
      "jetbrains-toolbox"
      "visual-studio-code"
      "blender"
      "rectangle"
      "iterm2"

      # games
      "prismlauncher"
      "steam"

      # utilities
      "linearmouse"
      "raycast"

      # browsers / wrappers
      "firefox"
      "arc"

      # communication
      "signal"

      # appearance
      "font-sf-mono-nerd-font-ligaturized"
      "font-hack-nerd-font"
      "sf-symbols"
    ];
    brews = [
      "sketchybar"
      "switchaudio-osx"
      "pidof"
    ];
  };
}
