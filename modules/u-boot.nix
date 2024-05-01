{ config, lib, pkgs, ... }:
let
  inherit (lib)
    mkIf
    optionals
    versionOlder
    versionAtLeast
  ;
  inherit (pkgs)
    fetchpatch
  ;

  inherit (config.Tow-Boot)
    uBootVersion
  ;

  tbPatch =
    rev: sha256:
    fetchpatch {
      url = "https://github.com/Tow-Boot/U-Boot/commit/${rev}.patch";
      inherit sha256;
    }
  ;
in
{  # Fixes for stock U-Boot
  Tow-Boot.patches = []
  ++ fetchpatch {
      url = "https://github.com/calvinweb/Tow-Boot-orangepi4lts/raw/development/a.patch";
    }
  ;

}
