{ config, pkgs, lib, ... }: {
  services.yabai = {
    enable = false;
    config = {
      focus_follows_mouse = "autoraise";
      window_placement = "second_child";
      window_origin_display = "default";
      window_opacity = "on";
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      window_topmost = "on";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 5;
      split_ratio = 0.66;
      layout = "bsp";
    };
  };
  services.skhd = {
    enable = false;
    skhdConfig = ''
      alt - d : yabai -m window --toggle zoom-parent
      alt - f : yabai -m window --toggle zoom-fullscreen
      alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
      shift + alt - a : yabai -m window --resize left:-20:0
      shift + alt - w : yabai -m window --resize top:0:-20
      shift + cmd - s : yabai -m window --resize bottom:0:-20
      shift + cmd - w : yabai -m window --resize top:0:20
    '';
  };
}
