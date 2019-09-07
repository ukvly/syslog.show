{ nixpkgs ? <nixpkgs>, pkgs ? import <nixpkgs> { }, stdenv ? pkgs.stdenv }:

let octopod = pkgs.callPackage (import ./nix/octopod) { };
in stdenv.mkDerivation {
  pname = "ukvly-podcast";
  version = "0";

  src = ./.;

  nativeBuildInputs = [ octopod ];
}
