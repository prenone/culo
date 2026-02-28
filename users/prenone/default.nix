{ pkgs, ... }:

{
  users.users.prenone = {
    isNormalUser = true;
    description = "Achille";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "changeme";

    home = "/home/prenone";
    createHome = true;

    linger = true;
  };

  programs.zsh.enable = true;
}
