{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./zsh.nix
    ./git.nix
    ./firefox.nix
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    alacritty
    vscode
  ];
}