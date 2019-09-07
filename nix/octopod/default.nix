{ lib, bundlerEnv, ruby }:

bundlerEnv rec {
  pname = "jekyll-octopod";

  version = (import ./gemset.nix).jekyll-octopod.version;
  inherit ruby;
  # expects Gemfile, Gemfile.lock and gemset.nix in the same directory
  gemdir = ./.;

  meta = with lib; {
    description = "A podcast publishing extension for the static site generator Jekyll";
    homepage    = https://jekyll-octopod.github.io/;
    license     = with licenses; mit;
    platforms   = platforms.unix;
  };
}
