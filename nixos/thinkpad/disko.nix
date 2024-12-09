{
  disko.devices.disk.ssd = {
    type = "disk";

    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {
	ESP = {
	  type = "EF00";
	  size = "500M";
	  content = {
	    type = "filesystem";
	    format = "vfat";
	    mountpoint = "/boot";
	  };
	};
	swap = {
	  size = "8G";
	  content = {
	    type = "swap";
	    resumeDevice = true;
	  };
	};
	root = {
	  size = "100%";
	  content = {
	    type = "filesystem";
	    format = "ext4";
	    mountpoint = "/";
	  };
	};
      };
    };
  };
}
