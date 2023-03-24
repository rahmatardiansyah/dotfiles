{ lib, stdenv, libX11, patches ? [ ], writeText, conf ? null }:

stdenv.mkDerivation {
  pname = "dwmblocks";
  version = "1";

  src = ./dwmblocks-async;

  buildInputs = [ libX11 ];

  inherit patches;

  postPatch = let
    configFile = if lib.isDerivation conf || builtins.isPath conf then
      conf
    else
      writeText "config.h" conf;
  in lib.optionalString (conf != null) "cp ${configFile} config.h";

  makeFlags = [ "PREFIX=$(out)" ];
}
