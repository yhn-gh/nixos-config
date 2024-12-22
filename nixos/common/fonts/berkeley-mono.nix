{ lib
, requireFile
, stdenvNoCC
, unzip
, passwordFile
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono";
  name = "Berkeley Mono";

  src = requireFile rec {
    name = "berkeley-mono-typeface-encrypted.zip";
    sha256 = "0k1bs571vbrg10lglrmsq085c2sivmnnb39pnp00vv83b41dcb51";
    message = ''
    '';
  };

  outputs = [ "out" "web" "variable" "variableweb" ];

  nativeBuildInputs = [
    unzip
  ];

  # requires --impure but whatever
  unpackPhase = ''
    PASSWORD=${lib.readFile passwordFile} 
    unzip -P $PASSWORD $src
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
