{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./zsh.nix
    ./git.nix
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    alacritty
    firefox
    vscode
  ];
}