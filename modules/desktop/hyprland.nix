{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.hyprland;
in
{
  imports = [
    ./hyprland/ashell.nix
  ];

  options.my.desktop.hyprland = {
    enable = lib.mkEnableOption "Hyprland desktop stack";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    security.polkit.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland";
    };
  };
}
