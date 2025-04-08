{
  stdenvNoCC
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "downmix";
  version = "1.0.0";
  src = ../.;
  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/mpv/scripts/downmix
    cp downmix.lua $out/share/mpv/scripts/downmix

    runHook postInstall
  '';
  passthru.scriptName = "downmix/downmix.lua";
})
