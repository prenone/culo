{ pkgs, ... }:

{
  imports = [
    ./hyprland
    ../../common/home/restic.nix
    ./zsh.nix
    ./git.nix
    ./firefox.nix
    ./vscode.nix
    ./direnv.nix
  ];

  prenone.restic.enable = true;
  prenone.restic.scheduleOnActivation = true;
  prenone.restic.configPath = ./restic-config.yaml;

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    alacritty
  ];
}
