{
  inputs,
  pkgs,
  ...
}:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };

in {

  programs.firefox = {
    nativeMessagingHosts = [
    pkgs.ff2mpv-rust
    ];
    enable = true;
    profiles.yhn = {
      isDefault = true;
      search = {
	default = "DuckDuckGo";
	force = true;
        engines = {
	  "Nix Packages" = {
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
		{ name = "type"; value = "packages"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];

	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };
	};
      };

      settings = {
	"full-screen-api.warning.timeout" = 0;
	"sidebar.position_start" = false;
      };

      userChrome = /* css */ ''
#TabsToolbar {
display: none !important;
}

#sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
display: none;
}

#sidebar-splitter {
width: 2px !important;
}
      '';

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
	ublock-origin
	greasemonkey
	tree-style-tab
	ff2mpv
	duckduckgo-privacy-essentials
	multi-account-containers
	onepassword-password-manager
	yomitan
      ];
    };
    policies = {
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;

      Preferences = {

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;

          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;

          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;

          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

	  "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

	  "browser.uidensity" = 1;
	  "browser.compactmode.show" = true;
	  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

      };
    };
  };
}
