{
  config,
  ...
}: {
  sops.secrets."user-password".neededForUsers = true;
  users = {
    mutableUsers = false;
    users = {
      root = {
	isSystemUser = true;
	hashedPasswordFile = config.sops.secrets."user-password".path;
      };

      yhn = {
	isNormalUser = true;
	uid = 1000;

	hashedPasswordFile = config.sops.secrets."user-password".path;

	group = "yhn";
	extraGroups = [
	  "wheel"
	  "video"
	  "syncthing"
	  "dialout"
	];
      };
    };

    groups = {
      yhn.gid = 1000;
    };
  };
}
