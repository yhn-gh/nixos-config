{
  config,
  ...
}: {
  age.secrets.wireguard-privkey.rekeyFile = ./priv-key.age;

  networking.wg-quick.interfaces.wg0 = {
    address = [ "10.2.0.2/32" ];
    #dns = [ "10.2.0.1" ];
    privateKeyFile = config.age.secrets.wireguard-privkey.path;
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
