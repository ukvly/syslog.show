{ sources ? import ./sources.nix, nixpkgs ? sources.nixpkgs
, pkgs ? import nixpkgs { } }:

let
  gitignore = import sources.gitignore { inherit (pkgs) lib; };
in rec {
  octopod = pkgs.callPackage ./octopod { };

  syslog = pkgs.callPackage ./build.nix { inherit gitignore octopod; };

  upload = pkgs.callPackage ./upload.nix { inherit syslog; };
}
