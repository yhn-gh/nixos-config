{
  pkgs,
  lib,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings.yazi.manager = {
      sort_by = "extension";
    };
    keymap = {
      manager = {
	prepend_keymap = [
	  {
	    # https://yazi-rs.github.io/docs/tips/#selected-files-to-clipboard
	    on = "y";
	    run = [
	      ''shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' --confirm''
	      ''yank''
	    ];
	  }
	];
      };
    };

    plugins = {
    };
  };
}
