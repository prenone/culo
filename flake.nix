{
  description = "Culo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # Not common stuff
    ashell.url = "github:MalpenZibo/ashell";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      nixosConfigurations.mbare = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };

        modules = [
          (
            { ... }:
            {
              nixpkgs.overlays = import ./overlays { inherit inputs; };
            }
          )

          home-manager.nixosModules.home-manager
          ./hosts/mbare
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nixd
          nixfmt-rfc-style
          deadnix
          statix
          nil
        ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
