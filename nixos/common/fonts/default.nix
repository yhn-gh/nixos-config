{
  pkgs,
  config,
  ...
}: let
  berkeley-mono = pkgs.callPackage ./berkeley-mono.nix rec { passwordFile = config.age.secrets.berkeley-mono.path; };
in {
  age.secrets.berkeley-mono.rekeyFile = ./berkeley-mono.age;

  fonts.packages = with pkgs; [
    berkeley-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

}
