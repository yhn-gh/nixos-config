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
	# JP #70
	endpoint = "37.19.205.223:51820";
	publicKey = "IekoLP3CpczVNhssbBTXJ1SVwLbBtofVeGhqjBHRrlM=";
	allowedIPs = [ "0.0.0.0/0" ];
      }
    ];
  };
}
