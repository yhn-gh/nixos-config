let 
  wallpaper = ../wallpaper.png;
in {
  imports = [
    ./cursor.nix
    ./input.nix
    ./keybindings.nix
    ./output.nix
    ./eww-bar.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {

      bars = [];

      window = {
	titlebar = false;
	border = 0;
      };

      output = {
	eDP-1 = {
	  bg = "${wallpaper} fill";
	};
      };
    };
  };
}
