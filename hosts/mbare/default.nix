{
  inputs,
  ...
}:
let
  hostname = builtins.baseNameOf (toString ./.);
  diskById = "/dev/disk/by-id/nvme-SAMSUNG_MZVLB2T0HALB-000L7_S4GCNE0MB02812";
in
{
  _module.args = {
    inherit hostname diskById;
  };

  imports = [
    ../../modules/common/base-packages.nix

    ./configuration.nix
    ./hardware-configuration.nix

    inputs.disko.nixosModules.disko
    ./disko.nix
  ];
}
