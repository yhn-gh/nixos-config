{
  lib,
  pkgs,
  ...
}: {
  home.sessionVariables = {
      XDG_CURRENT_DESKTOP="Sway";
      GTK_IM_MODULE="kime";
      QT_IM_MODULE="kime";
      XMODIFIERS="@im=kime";
  };
  wayland.windowManager.sway = {
    config = {
      startup = [
      { command = "${lib.getBin pkgs.kime}/bin/kime-wayland"; }
      ];

      input = {
	"*" = {
	  xkb_layout = "kr";
	  xkb_options = "korean:ralt_hangul";
	};
      };
    };
  };
}
