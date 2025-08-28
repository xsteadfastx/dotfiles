{
  pkgs,
  pkgsUnstable,
  nixosConfig,
  ...
}:
let
  cfg = nixosConfig.xsfx;
in
{
  systemd.user.startServices = "sd-switch";

  home.packages = with pkgsUnstable; [
    # systemtools
    appimage-run
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
    progress
    python3
    ripgrep
    rlwrap
    starship
    tree
    unzip
    veilig
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
    agenix
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
    go-task
    gopass
    pandoc
    pkgs.gnupg
    pkgs.tectonic
    qrcp # easy sending files to android
    rclone
    w3m
    yaegi

    # vpn
    (writeShellScriptBin "wobcom-vpn" ''
      set -e

      ${tmux}/bin/tmux rename-window "wobcom-vpn"
      sudo ${openfortivpn}/bin/openfortivpn \
      vpn.wobcom.de \
      --trusted-cert 7a3f29e18c303c26080671cd1c0925ba2ae7c229c50eef6222d6f1453596e88d \
      --trusted-cert c815544ef4367147ab4bc564430efd72258eb2f6e1d634503c2f48c7b77da544 \
      -u mpreuss \
      -p $(${gopass}/bin/gopass show -o WOBCOM/ldap)
    '')

    # tmux wrapper for always same session
    (writeShellScriptBin "tmx" ''
      set -e

      ${tmux}/bin/tmux new-session -t local
    '')

    # ssh
    sshfs

    # camera
    airmtp
    imagingedge4linux
    importsony
    importsony-jpegs

    # work
    (lib.mkIf cfg.work kerouac)
  ];

}
