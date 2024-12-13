{
  home.shellAliases = {
    wgu = "sudo systemctl start wg-quick-wg0";
    wgd = "sudo systemctl stop wg-quick-wg0";
    ls = "eza -lhg";
    lt = "eza --tree";
    gc = "sudo nix-collect-garbage";
    ya = "yazi";
    ze = "zellij attach --create main";
    zj = "zellij";
    ra = "rust-analyzer";
  };
}
