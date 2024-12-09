{
  config,
  ...
}:{

  programs.git = {
    enable = true;
    userName = "yhn";
    userEmail = "yhn@yhn.fyi";
    extraConfig = {
      core.editor = "nvim";
      github.user = "teq98";
    };
  };
}
