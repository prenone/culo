{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.prenone.restic;

  rel = "resticprofile/config.yaml";
  abs = "${config.xdg.configHome}/${rel}";

  resticprofileBackup = pkgs.writeShellScriptBin "resticprofile-backup" ''
    set -euo pipefail
    exec ${pkgs.resticprofile}/bin/resticprofile \
      --config "$HOME/.config/resticprofile/config.yaml" \
      backup
  '';
in
{
  options.prenone.restic = {
    enable = lib.mkEnableOption "restic backups via resticprofile";

    scheduleOnActivation = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Run `resticprofile schedule --all` during home-manager activation.";
    };

    configPath = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      example = lib.literalExpression "./config.yaml";
      description = ''
        Path to the resticprofile config.yaml to install at:
        $XDG_CONFIG_HOME/resticprofile/config.yaml
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.configPath != null;
        message = "prenone.restic.configPath must be set when prenone.restic.enable = true";
      }
    ];

    xdg.enable = true;

    home.packages = [
      pkgs.restic
      pkgs.resticprofile
      resticprofileBackup
    ];

    xdg.configFile.${rel} = {
      source = cfg.configPath;
      force = true;
    };

    xdg.desktopEntries.resticprofile-backup = {
      name = "Backup the system";
      comment = "Run a backup using resticprofile";
      terminal = true;
      icon = "save";

      categories = [
        "Utility"
        "Archiving"
      ];

      exec = "${resticprofileBackup}/bin/resticprofile-backup";
    };

    home.activation.resticprofileSchedule = lib.mkIf cfg.scheduleOnActivation (
      lib.hm.dag.entryAfter [ "linkGeneration" ] ''
        set -euo pipefail
        export PATH="${pkgs.systemd}/bin:$PATH"
        ${pkgs.resticprofile}/bin/resticprofile --config ${lib.escapeShellArg abs} schedule --all
        ${pkgs.systemd}/bin/systemctl --user daemon-reload >/dev/null 2>&1 || true
      ''
    );
  };
}
