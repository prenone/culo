{
  inputs,
  ...
}:
let
  hostname = builtins.baseNameOf (toString ./.);
  diskById = "/dev/disk/by-id/nvme-Micron_2400_MTFDKBA512QFM_232541A9F226";
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
