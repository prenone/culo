{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

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