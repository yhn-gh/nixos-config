{
  config,
  ...
}: {
  sops.secrets = {
    "wireguard-privkey" = {
      owner = config.users.users.yhn.name;
      inherit (config.users.users.yhn) group;
    };
  };

  networking.wg-quick.interfaces.wg0 = {
    address = [ "10.2.0.2/32" ];
    #dns = [ "10.2.0.1" ];
    privateKeyFile = config.sops.secrets."wireguard-privkey".path;
    peers = [
      {
	# HK #40
	endpoint = "146.70.113.98:51820";
	publicKey = "/AEriTfHYyrhW+bj1cDy9RroL4j4o1tv9sw4m+aB8lA=";
	allowedIPs = [ "0.0.0.0/0" ];
      }
    ];
  };
}
