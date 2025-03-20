{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "git-repositories" = {
	host = "gitlab.com github.com";
	identitiesOnly = true;
	identityFile = [
	  "/etc/ssh/ssh_host_ed25519_key"
	];
      };
    };
  };
}
