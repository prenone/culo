{
  config,
  pkgs,
  lib,
  hostname,
  ...
}:

{
  networking.hostName = hostname;

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "rtsx_pci_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.supportedFilesystems = [ "btrfs" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  imports = [
    ../../modules/common/immutable-users.nix
    ../../modules/common/restic.nix
    ../../modules/desktop/vscode.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/firefox.nix
    ../../modules/desktop/1password.nix
    ../../users/prenone
  ];

  security.sudo.wheelNeedsPassword = true;

  my.desktop.hyprland.enable = true;

  home-manager.users.prenone = import ../../users/prenone/home/default.nix;
  home-manager.backupFileExtension = "backup";

  system.stateVersion = "25.11";
}
