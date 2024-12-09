{
  pkgs, ...
}: {
  users.users.yhn.shell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  environment.pathsToLink = ["/share/fish"];

}
