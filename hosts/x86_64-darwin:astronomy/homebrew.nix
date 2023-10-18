{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    casks = [
      # development toolkits
      "temurin"

      # development workflows
      "jetbrains-toolbox"

      # games
      "prismlauncher"

      # browsers / wrappers
      "firefox"
      "yt-music"

      # communication
      "signal"
    ];
  };
}
