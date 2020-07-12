{ sources ? import ./sources.nix, nixpkgs ? sources.nixpkgs
, pkgs ? import nixpkgs { } }:

rec {
  octopod = pkgs.callPackage ./octopod { };

  syslog = pkgs.callPackage ./build.nix { inherit octopod; };
}
