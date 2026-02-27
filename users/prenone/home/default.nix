{ pkgs, ... }:

{
  imports = [
    ./hyprland
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
