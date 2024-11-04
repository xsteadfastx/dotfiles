{ config, pkgs, system, inputs, ... }@args:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config = {
      allowUnfree = true;
    };
    overlays = [
      # up to date neovim
      (final: prev: {
        neovim = prev.neovim-unwrapped.overrideAttrs {
          src = prev.fetchFromGitHub {
            owner = "neovim";
            repo = "neovim";
            rev = "v0.10.2";
            hash = "sha256-+qjjelYMB3MyjaESfCaGoeBURUzSVh/50uxUqStxIfY=";
          };
        };
      })

      # needed because there is a system gpg-agent and gpg from wrapped gopass mismatch
      (final: prev: {
        gopass = prev.gopass.overrideAttrs rec {
          wrapperPath = args.lib.makeBinPath ([ prev.git prev.xclip ] ++ args.lib.optional prev.stdenv.isLinux prev.wl-clipboard);
          postFixup = ''
            wrapProgram $out/bin/gopass \
              --prefix PATH : "${wrapperPath}" \
              --set GOPASS_NO_REMINDER true
          '';
        };
      })

      (final: prev: {
        go-task = prev.go-task.overrideAttrs (finalAttrs: previousAttrs: { patches = [ ]; });
      })
    ];
  };

  airmtp = inputs.airmtp.packages.${system}.default;
in

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
    gping
    htop
    mtr
    ncdu
    nmap
    ripgrep
    tree
    viddy

    # mail
    isync
    neomutt
    notmuch

    # dev
    git
    pkgs.delta

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

    # browser
    google-chrome

    # backup
    restic

    # media
    abcde
    handbrake
    makemkv

    # communication
    signal-desktop
    slack

    # other tools
    airmtp
    ansible_2_15
    babelfish
    croc
    fx
    glab
    go-task
    gopass
    pandoc
    qrcp # easy sending files to android
    rclone
    tectonic
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
