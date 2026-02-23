From a live NixOs USB:

## Partition disk
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake .#mbare
```

## Install NixOs
```bash
sudo nixos-install --flake .#mbare
```
