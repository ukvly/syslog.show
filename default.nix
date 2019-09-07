{ nixpkgs ? <nixpkgs>, pkgs ? import <nixpkgs> { }, stdenv ? pkgs.stdenv }:

let octopod = pkgs.callPackage (import ./nix/octopod) { };
in stdenv.mkDerivation {
  pname = "ukvly-podcast";
  version = "0";

  src = (pkgs.nix-gitignore.gitignoreSource [] ./.);

  nativeBuildInputs = [ octopod ];

  buildPhase = ''
    octopod build
  '';

  installPhase = ''
    mkdir -p $out
    mv _site $out/www
  '';
}
