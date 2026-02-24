{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.ashell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
