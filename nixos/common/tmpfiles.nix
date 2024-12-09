{
  pkgs,
  lib,
  ...
}: {
  systemd.tmpfiles.settings = {
  "10-syncthing" = {
      "/var/lib/syncthing" = {
	"d" = {
	  group = "syncthing";
	  user = "syncthing";
	  mode = "0775";
	};
      };
    };
  };
}
