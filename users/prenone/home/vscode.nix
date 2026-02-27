{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = false;

    profiles.default = {

      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        mkhl.direnv
      ];

      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "workbench.secondarySideBar.defaultVisibility" = "hidden";

        "nix.serverSettings" = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };

            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };

            options = {
              nixos = {
                expr = "(builtins.getFlake \"\${workspaceFolder}\").nixosConfigurations.mbare.options";
              };

              "home-manager" = {
                expr = "(builtins.getFlake \"\${workspaceFolder}\").nixosConfigurations.mbare.options.home-manager.users.type.getSubOptions []";
              };
            };
          };
        };

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };
      };
    };
  };
}
