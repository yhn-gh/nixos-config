{
  config,
  lib,
  pkgs,
  ...
}: let
  modifier = config.wayland.windowManager.sway.config.modifier;
  sattyConfig = ./satty.toml;
in {
    wayland.windowManager.sway = {
      enable = true;
      config = {
	modifier = "Mod4";

	keybindings = {
	  "${modifier}+Return" = "exec ${lib.getExe pkgs.alacritty}";
	  "${modifier}+q" = "kill";
	  "${modifier}+f" = "floating toggle";
	  "${modifier}+r" = "exec ${lib.getBin pkgs.bemenu}/bin/bemenu-run --bottom --ignorecase --prompt \"\" --fn \"Berkeley Mono\" 16 --list \"5 up\"";

	  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

	  "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
	  "XF86AudioLowerVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

	  "XF86MonBrightnessUp" = "exec light -A 2";
	  "XF86MonBrightnessDown" = "exec light -U 2";

	  "Print" = "exec grim - | wl-copy";
	  "Shift+Print" = "exec grim -g \"$(slurp -o -r -c '#ff0000ff')\" -t ppm - | satty --config ${sattyConfig} --filename -";
	}
	// ( lib.listToAttrs ( lib.flatten (lib.genList (i: [
	{
	  name = "${modifier}+${toString i}";
	  value = "workspace number ${toString i}";
	}
	{
	  name = "${modifier}+Shift+${toString i}";
	  value = "move container to workspace number ${toString i}";
	}
	])9))
	  );
      };
    };
}
