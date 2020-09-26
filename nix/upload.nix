{ stdenvNoCC, makeWrapper, lib, lftp, syslog }:

stdenvNoCC.mkDerivation {
  name = "syslog-upload";

  src = ./.;

  nativeBuildInputs = [ makeWrapper ];
  
  doConfigure = false;

  buildPhase = ''
    patchShebangs upload
  '';
  
  installPhase = ''
    mkdir -p $out/bin

    install -m 0755 upload $out/bin
    wrapProgram $out/bin/upload --prefix PATH : ${lib.makeBinPath [ lftp ]} \
                                --set SYSLOG_WWW ${syslog}/www
  '';

}
