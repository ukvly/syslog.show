{ sources ? import ./nix/sources.nix, nixpkgs ? sources.nixpkgs
, pkgs ? import nixpkgs { } }:

let release = import ./nix/release.nix { inherit sources nixpkgs pkgs; };
in pkgs.mkShell {

  inputsFrom = [
    release.syslog
  ];
  
  buildInputs = [
    # To update dependencies.
    pkgs.niv

    # To update octopod.
    pkgs.bundix
    pkgs.bundler
    pkgs.ruby
  ];
}
