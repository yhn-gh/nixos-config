{
  inputs, ...
}: {
  flake.nixosConfigurations = let
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
	system = builtins.readFile(../nixos + "/${hostname}/system.txt"); # Future-proofing for ARM

	specialArgs.inputs = inputs;

	modules = [
	  ../nixos/${hostname}

	  inputs.home-manager.nixosModules.home-manager
	  {
	    nixpkgs.overlays = [
	      inputs.nur.overlay
	    ];
	  }

	  {
	    home-manager = {
	      useGlobalPkgs = true;
	      useUserPackages = true;
	      users.yhn = {
	        imports = [
		  ../home/${hostname}
		];
	      };
	      extraSpecialArgs.inputs = inputs;
	    };
	  }
	];
      };
    in {
      "thinkpad" = mkHost "thinkpad";
    };
}
