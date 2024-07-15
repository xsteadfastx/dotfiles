# dotfiles

## init

    git init
    git remote add origin https://git.xsfx.dev/xsteadfastx/dotfiles.git
    git checkout main

## home manager

### Install

    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install

### Update

    nix flake update
    git add -f flake.nix home.nix
    home-manager switch --flake .#xsfx
