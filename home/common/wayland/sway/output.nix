{
  config,
  lib,
  ...
}: {
  options.myModules.sway = {
    scaling = lib.mkOption { default = "1";};
  };

  config = 
    let
    cfg = config.myModules.sway;
  in {
    wayland.windowManager.sway = {
      config.output = {
	eDP-1 = {
	  scale = "${cfg.scaling}";
	};
      };
      extraOptions = [
	"--unsupported-gpu"
      ];
    };
  };
}
