{ lib
, requireFile
, stdenvNoCC
, unzip
, secrets
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono";
  name = "Berkeley Mono";

  src = "./";

  outputs = [ "out" "web" "variable" "variableweb" ];

  unpackPhase = ''
    cp -R ${secrets}/berkeley-mono-typeface/* $src
  '';

  installPhase = ''
    runHook preInstall

    install -D -m444 -t $out/share/fonts/opentype berkeley-mono/OTF/*.otf
    install -D -m444 -t $out/share/fonts/truetype berkeley-mono/TTF/*.ttf
    install -D -m444 -t $web/share/fonts/webfonts berkeley-mono/WEB/*.woff2
    install -D -m444 -t $variable/share/fonts/truetype berkeley-mono-variable/TTF/*.ttf
    install -D -m444 -t $variableweb/share/fonts/webfonts berkeley-mono-variable/WEB/*.woff2

    runHook postInstall
  '';

  meta = { /* … */ };
})
