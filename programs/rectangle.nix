{ config, pkgs, lib, ... }: {
  system.defaults.CustomUserPreferences."com.knollsoft.Rectangle" = {
    SUHasLaunchedBefore = 0;
    SUEnableAutomaticChecks = 0;
    launchOnLogin = 1;
    alternateDefaultShortcuts = 1;
    footprintAnimationDurationMultiplier = "0.75";
    screenEdgeGapTop = 55;
    gapSize = 10;
  };
}
