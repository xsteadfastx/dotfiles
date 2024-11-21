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

      (final: prev: {
        localsend-go = prev.buildGo123Module rec {
          pname = "localsend-go";
          version = "1.1.0";

          src = prev.fetchFromGitHub {
            owner = "meowrain";
            repo = "localsend-go";
            rev = version;
            hash = "sha256-oQqK0Omqeqs0gflyDt72TbJUeNmCr3kzlFblgAwayYQ=";
          };

          vendorHash = "sha256-wjrtv1Y1umQlbc1JhYd4uJ9QXCtucAUI8WCbeIqE1do=";
          subPackages = "cmd/";
          ldflags = [
            "-s"
            "-w"
          ];
          CGO_ENABLED = 0;

          postInstall = ''
            mv $out/bin/cmd $out/bin/localsend-go
          '';
        };
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
    difftastic

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

    # filetransfer
    localsend-go

    # other tools
    airmtp
    ansible
    babelfish
    croc
    fx
    glab
    go-task
    gopass
    git-credential-gopass
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
