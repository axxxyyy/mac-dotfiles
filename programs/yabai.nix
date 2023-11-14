{ config, pkgs, lib, ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      split_ratio = "0.66";
      window_shadow = "on";
      window_topmost = "on";
      window_opacity = "on";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.9";
      external_bar = "main:55:0";
      layout = "bsp";
      focus_follow_ouse = "autoraise";
      mouse_follow_focus = "off";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
    };
  };
}
