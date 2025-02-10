{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
	size = 14;
	builtin_box_drawing = false;
      };

# Colors (Kanagawa Dragon)
# Source https//github.com/rebelot/kanagawa.nvim
      colors.primary = {
	background = "#181616";
	foreground = "#c5c9c5";
      };

      colors.normal = {
	black = "#0d0c0c";
	blue = "#8ba4b0";
	cyan = "#8ea4a2";
	green = "#8a9a7b";
	magenta = "#a292a3";
	red = "#c4746e";
	white = "#C8C093";
	yellow = "#c4b28a";
      };

      colors.bright = {
	black = "#a6a69c";
	blue = "#7FB4CA";
	cyan = "#7AA89F";
	green = "#87a987";
	magenta = "#938AA9";
	red = "#E46876";
	white = "#c5c9c5";
	yellow = "#E6C384";
      };

      colors.selection = {
	background = "#2d4f67";
	foreground = "#c8c093";
      };
    };
  };
}
