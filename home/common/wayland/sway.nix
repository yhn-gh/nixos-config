{
  pkgs,
  lib,
  config,
  ...
}: let
  modifier = config.wayland.windowManager.sway.config.modifier;
in {
  home.packages = with pkgs; [
    pkgs.bibata-cursors
  ];

  home.sessionVariables = {
      XDG_CURRENT_DESKTOP="Sway";
      GTK_IM_MODULE="kime";
      QT_IM_MODULE="kime";
      XMODIFIERS="@im=kime";
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {

      bars = [];
      modifier = "Mod4";
      window = {
	titlebar = false;
	border = 0;
      };

      startup = [
	{ command = "${lib.getBin pkgs.kime}/bin/kime-wayland"; }
	{ command = "${lib.getExe pkgs.eww} open statusbar"; }
	{ command = "swaymsg seat seat0 xcursor_theme Bibata-Modern-Classic 16"; }
      ];

      keybindings = {
	"${modifier}+Return" = "exec ${lib.getExe pkgs.alacritty}";
	"${modifier}+q" = "kill";
	"${modifier}+r" = "exec ${lib.getBin pkgs.bemenu}/bin/bemenu-run --bottom --ignorecase --list \"5 up\"";

	"XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

	"XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
	"XF86AudioLowerVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

	"XF86MonBrightnessUp" = "exec light -A 1";
	"XF86MonBrightnessDown" = "exec light -U 1";

	"Print" = "exec grim - | wl-copy";
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
      ]
	) 9)
	)
      );

      input = {
	"*" = {
	  xkb_layout = "kr";
	  xkb_options = "korean:ralt_hangul";
	};
      };

      output = {
	eDP-1 = {
	  scale = "1.3333";
	};
      };

    };
  };
  gtk.enable = true;

  gtk.theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };

  gtk.cursorTheme = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 16;
  };

}

