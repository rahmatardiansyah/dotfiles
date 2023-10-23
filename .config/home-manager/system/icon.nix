{ lib, stdenvNoCC, fetchurl, unzip }:

stdenvNoCC.mkDerivation rec {
  pname = "Buuf Nestort";
  version = "1.0.0";

  src = fetchurl {
    url = "https://git.disroot.org/eudaimon/buuf-nestort/archive/master.zip";
    sha256 = "727edac6662361d43a30a9396a864eccf352aba3f3ed942e2765e388fe08082d";
  };

  sourceRoot = ".";
  nativeBuildInputs = [ unzip ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    ls -la
    cp -r ./buuf-nestort $out/share/icons
    runHook postInstall
  '';
}
