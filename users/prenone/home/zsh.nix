{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}