{
  pkgs,
  ...
} :{
  xdg.portal.enable = true;
  xdg.portal.wlr = {
    enable = true;
    settings = {
      screencast = {
	output_name = "eDP-1";
	max_fps = 30;
	chooser_type = "simple";
	chooser_cmd = "${pkgs.bemenu}/bin/bemenu -b --prompt='Select the monitor to share:'";
      };
    };
  };
}
