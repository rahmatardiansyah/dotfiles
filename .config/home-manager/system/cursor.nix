{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "macOS-BigSur-White";
  version = "2.0.0";

  src = fetchurl {
    url = "https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur-White.tar.gz";
    sha256 = "bc53d73b6cd7b64fc8dfc396bf90c8bd1bb6cfc1866e51130bb285eabb867261";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r ./macOS-BigSur-White $out/share/icons
    runHook postInstall
  '';
}
