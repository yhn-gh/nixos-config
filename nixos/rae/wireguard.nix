{
  config,
  ...
}: {
  sops.secrets = {
    "wireguard-privkey"."rae" = {
      owner = config.users.users.yhn.name;
      inherit (config.users.users.yhn) group;
    };
  };

  networking.wg-quick.interfaces.wg0 = {
    address = [ "10.2.0.2/32" ];
    #dns = [ "10.2.0.1" ];
    privateKeyFile = config.sops.secrets."wireguard-privkey"."rae".path;
    peers = [
      {
	# HK #40
	endpoint = "79.110.55.2:51820";
	publicKey = "kwmJ9x2fBnD1PyYM9alhOW835krOfgVCr6ArMLA1pGk=";
	allowedIPs = [ "0.0.0.0/0" ];
      }
    ];
  };
}
