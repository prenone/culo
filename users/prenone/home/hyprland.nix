{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "alacritty"
      ];

      bind = [
        "$mod, Return, exec, alacritty"
      ];

      input = {
        touchpad.natural_scroll = true;
      };
    };
  };
}