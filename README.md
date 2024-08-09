# dotfiles

## init

    git init
    git remote add origin https://git.xsfx.dev/xsteadfastx/dotfiles.git
    git checkout main

## home manager

### Install

    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    nix run .#homeConfigurations.xsfx.activationPackage

### Update

    nix flake update
    git add -f flake.nix home.nix
    home-manager switch --flake .#xsfx

### Updating nix stuff

    nix-channel --update
    nix-env -u '*'
    nix-env --install --file '<nixpkgs>' --attr nix
