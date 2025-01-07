{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (retroarch.overrideAttrs {
      cores = with libretro; [
	beetle-psx
	pcsx2
      ];
    })
  ];
}
