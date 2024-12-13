{
  pkgs,
  lib,
  ...
}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    hyprctl setcursor Bibata-Modern-Classic 16 &
    eww open statusbar
  '';
in {
  home.packages = with pkgs; [
    pkgs.bibata-cursors
  ];
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      exec-once = ''${startupScript}/bin/start'';

      monitor = ", preferred, auto, 1.33333";

      animation = [
	#"windows, 1, 1, default, popin 100%"
	"windows, 0, 0, default, popin 0%"
	#"fadeIn, 1, 6, default"
	"fadeIn, 0"
	"fadeOut, 0"
	#"fadeOut, 1, 4, default"
	"workspaces, 0"
      ];

      xwayland = {
	force_zero_scaling = true;
      };

      general = {
	border_size = 0;
	gaps_in = 0;
	gaps_out = 0;
      };


      decoration = {
	rounding = 0;
      };

      "$mod" = "SUPER";
      bind = [
	"$mod, RETURN, exec, kitty" # Show terminal
	"$mod, R, exec, wofi --show drun" # Show Wofi
	"$mod, Q, killactive" # Kill active window
	"$mod, F, togglefloating" # Kill active window
	"Shift_L, PRINT, exec, grim -g \"$(slurp -d)\" - | wl-copy"
	", PRINT, exec, grim - | wl-copy"
	", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ] ++
	(
	builtins.concatLists (builtins.genList (i:
	  let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	  ]
	) 9)
      );

      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, Control_L, movewindow"
	"$mod, mouse:273, resizewindow"
	"$mod, ALT_L, resizewindow"
      ];

      binde = [
	", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
	", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
	", XF86MonBrightnessUp, exec, light -A 2"
	", XF86MonBrightnessDown, exec, light -U 2"
      ];

      windowrule = [
	"float, pavucontrol"
	"float, steam"
	"float, org.gnome.Nautilus"
      ];
      
      windowrulev2 = [
        "size 290 165, title:(Picture-in-Picture)$"
        "move 990 644, title:(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "float, title:^(Picture-in-Picture)$"
        "workspace 9, title:^(Mozilla Firefox Private Browsing)$"
      ];

      device = {
	name = "at-translated-set-2-keyboard";
	kb_layout="us";
	#kb_variant="colemak_dh";
      };

    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
      "/home/yhn/.wallpaper/wallpaper.jpg"
      ];

      wallpaper = [
      ", /home/yhn/.wallpaper/wallpaper.jpg"
      ];
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
