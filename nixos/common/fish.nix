{
  pkgs, ...
}: {
  users.users.yhn.shell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set fish_key_bindings fish_default_key_bindings
    '';
  };

  environment.pathsToLink = ["/share/fish"];

}
