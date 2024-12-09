{
  users = {
    mutableUsers = false;
    users = {
      root = {
	isSystemUser = true;
	hashedPassword = "$y$j9T$BzUj2Dyj91ukm2YYcDq2z/$a0CVkoPv88lemfRUay5bmThyt1NQs6C3CDzYjkyJiZ/";
      };

      yhn = {
	isNormalUser = true;
	uid = 1000;

	hashedPassword = "$y$j9T$BzUj2Dyj91ukm2YYcDq2z/$a0CVkoPv88lemfRUay5bmThyt1NQs6C3CDzYjkyJiZ/";

	group = "yhn";
	extraGroups = [
	  "wheel"
	  "video"
	  "syncthing"
	];
      };
    };

    groups = {
      yhn.gid = 1000;
    };
  };
}
