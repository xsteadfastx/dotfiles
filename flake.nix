{
  description = "xsfx config";

  inputs = {
    # Stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    airmtp.url = "github:xsteadfastx/airmtp";

    compose2nix = {
      url = "github:aksiksi/compose2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs { inherit system; };

      pkgsUnstable = import inputs.nixpkgs-unstable {
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
              wrapperPath = pkgs.lib.makeBinPath ([ prev.git prev.xclip ] ++ pkgs.lib.optional prev.stdenv.isLinux prev.wl-clipboard);
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

          (final: prev: {
            airmtp = inputs.airmtp.packages.${system}.default;
          })

          (final: prev: {
            compose2nix = inputs.compose2nix.packages.${system}.default;
          })

          (final: prev: {
            bumblebee-status = prev.bumblebee-status.override { plugins = p: [ p.cpu p.nic ]; };
          })

        ];
      };
    in
    {
      homeConfigurations = {
        xsfx = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit system pkgsUnstable; };
        };
      };
    };
}
