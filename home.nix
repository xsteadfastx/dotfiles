{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "marv";
  home.homeDirectory = "/home/marv";

  home.stateVersion = "24.05";

  home.packages = with pkgs-unstable; [
    # systemtools
    bat
    eza
    fd
    fish
    fzf
    git
    gping
    nmap
    ripgrep
    tree

    # mail
    isync
    neomutt
    notmuch

    # go
    go

    # dev
    neovim

    # k8s
    k9s
    krew
    kubectl
    kubectx

    # other tools
    babelfish
    gopass
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
