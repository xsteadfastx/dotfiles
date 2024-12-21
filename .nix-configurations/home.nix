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
    neovim
    earthly

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

    # communication
    signal-desktop
    slack

    # filetransfer
    localsend-go

    # other tools
    airmtp
    ansible
    babelfish
    bumblebee-status
    compose2nix
    croc
    fx
    git-credential-gopass
    glab
    go-task
    gopass
    pandoc
    qrcp # easy sending files to android
    rclone
    tectonic
    w3m
    gnupg

    # x11
    alacritty
    arandr
    bumblebee-status
    dunst
    fish
    google-chrome
    networkmanagerapplet
    pavucontrol
    rofi
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
