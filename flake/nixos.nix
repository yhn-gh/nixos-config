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
	      inputs.nur.overlays.default
	      inputs.rust-overlay.overlays.default

	      # https://github.com/Riey/kime/issues/688
	      (
		final: prev:
		let
		  rustChannel = inputs.rust-overlay.packages.x86_64-linux.rust_1_81_0;
		in
		{
		  kime = prev.kime.override {
		    rustPlatform = prev.makeRustPlatform {
		      rustc = rustChannel;
		      cargo = rustChannel;
		    };
		    rustc = rustChannel;
		    cargo = rustChannel;
		  };
		}
	      )
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
      "rae" = mkHost "rae";
    };
}
