{ pkgsUnstable, ... }:
{
  home.username = "marv";
  home.homeDirectory = "/home/marv";

  home.stateVersion = "24.05";

  home.packages = with pkgsUnstable; [
    # systemtools
    bat
    btop
    eza
    fd
    fish
    fzf
    git-annex
    gping
    htop
    mtr
    ncdu
    nmap
    nodejs
    python3
    ripgrep
    starship
    tree
    unzip
    viddy

    # mail
    isync
    msmtp
    neomutt
    notmuch

    # dev
    git
    difftastic
    nixfmt-classic

    # go
    go

    # dev
    cargo
    cmake
    earthly
    gcc
    lua-language-server
    neovim

    # k8s
    k9s
    krew
    kubectl
    kubectx

    # vpn
    openfortivpn

    # download stuff
    yt-dlp

    # backup
    restic

    # media
    abcde
    handbrake
    makemkv

    # filetransfer
    localsend-go

    # other tools
    airmtp
    ansible
    babelfish
    bumblebee-status
    compose2nix
    croc
    fish
    fx
    git-credential-gopass
    glab
    gnupg
    go-task
    gopass
    pandoc
    qrcp # easy sending files to android
    rclone
    tectonic
    w3m
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
