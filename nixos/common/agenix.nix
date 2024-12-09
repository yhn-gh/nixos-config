{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.agenix.nixosModules.default
    inputs.agenix-rekey.nixosModules.default
  ];

  age.rekey = {
    storageMode = "local";
    masterIdentities = [
    {
	identity = ../../.secrets/identity.age;
	pubkey = "age12d9wqvvkdjcrm6mm9xanmhqcpsz4r452hz592qhp6ema6hszsvuqmz0sej";
    }
    ];
    localStorageDir = ../../.secrets/${config.networking.hostName};
  };
}
