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
            rev = "v0.10.1";
            hash = "sha256-OsHIacgorYnB/dPbzl1b6rYUzQdhTtsJYLsFLJxregk=";
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
          passthru = {
            inherit wrapperPath;
          };
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
    git
    gping
    htop
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

    # other tools
    airmtp
    ansible
    babelfish
    croc
    fx
    glab
    gopass
    rclone
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
