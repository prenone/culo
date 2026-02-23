{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user.name = "Achille Merendino";
    settings.user.email = "prenone03@gmail.com";

    settings.init.defaultBranch = "main";
  };
}