{ config, pkgs, system, inputs, ... }:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config = {
      allowUnfree = true;
    };
    overlays = [
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

    # other tools
    airmtp
    babelfish
    croc
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
