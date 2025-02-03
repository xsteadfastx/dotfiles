{ pkgs, pkgsUnstable, ... }: {
  home.packages = with pkgsUnstable; [
    # systemtools
    bat
    btop
    eza
    fd
    file
    fish
    fzf
    git-annex
    gping
    htop
    killall
    mtr
    ncdu
    nmap
    nodejs
    python3
    ripgrep
    rlwrap
    starship
    tree
    unzip
    viddy

    # mail
    aerc
    msmtp
    neomutt
    (writeShellScriptBin "checkmail" ''
      while true; do
      	${isync}/bin/mbsync -aV || true
      	${notmuch}/bin/notmuch new
      	sleep 1m
      done
    '')

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
    doggo
    fish
    fx
    git-credential-gopass
    glab
    pkgs.gnupg
    go-task
    gopass
    pandoc
    qrcp # easy sending files to android
    rclone
    tectonic
    w3m
    yaegi

    # vpn
    (writeShellScriptBin "wobcom-vpn" ''
      set -e

      ${tmux}/bin/tmux rename-window "wobcom-vpn"
      sudo ${openfortivpn}/bin/openfortivpn vpn.wobcom.de -u mpreuss -p $(${gopass}/bin/gopass show -o WOBCOM/ldap)
    '')

    # tmux wrapper for always same session
    (writeShellScriptBin "tmx" ''
      set -e

      ${tmux}/bin/tmux new-session -t local
    '')

    # ssh
    sshfs
  ];

}
