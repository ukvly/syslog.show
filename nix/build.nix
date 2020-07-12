{ stdenv, octopod, nix-gitignore }:

stdenv.mkDerivation {
  pname = "ukvly-podcast";
  version = "0";

  src = nix-gitignore.gitignoreSource [ ] ./..;

  nativeBuildInputs = [ octopod ];

  buildPhase = ''
    octopod build
  '';

  installPhase = ''
    mkdir -p $out
    mv _site $out/www
  '';
}
