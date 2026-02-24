{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./zsh.nix
    ./git.nix
    ./firefox.nix
    ./vscode.nix
    ./direnv.nix
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    alacritty
  ];
}
