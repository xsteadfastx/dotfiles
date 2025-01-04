{ pkgsUnstable, ... }: {
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

    # go
    go

    # dev
    difftastic
    earthly
    git
    gcc

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
    sshfs
    tectonic
    w3m
  ];

}
