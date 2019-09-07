{ nixpkgs ? builtins.fetchTarball {
  # Descriptive name to make the store path easier to identify
  name = "nixos-unstable-2019-09-07";
  url = https://github.com/nixos/nixpkgs/archive/3b5b9a73f59ff93d50156e250203410bdd07f4e0.tar.gz;
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "0kr25xqbv1ldp72jbmml21pc5hl7xcfqhclv5qxa5f860jddjznk";
}, pkgs ? import nixpkgs { }, stdenv ? pkgs.stdenv }:

let octopod = pkgs.callPackage (import ./nix/octopod) { };
in stdenv.mkDerivation {
  pname = "ukvly-podcast";
  version = "0";

  src = (pkgs.nix-gitignore.gitignoreSource [ ] ./.);

  nativeBuildInputs = [ octopod ];

  buildPhase = ''
    octopod build
  '';

  installPhase = ''
    mkdir -p $out
    mv _site $out/www
  '';
}
