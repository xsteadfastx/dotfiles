{ pkgs, system, inputs, ... }:
final: prev: {

  # up to date neovim
  neovim = prev.neovim-unwrapped.overrideAttrs {
    src = prev.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "v0.10.2";
      hash = "sha256-+qjjelYMB3MyjaESfCaGoeBURUzSVh/50uxUqStxIfY=";
    };
  };

  # needed because there is a system gpg-agent and gpg from wrapped gopass mismatch
  gopass = prev.gopass.overrideAttrs rec {
    wrapperPath = pkgs.lib.makeBinPath ([ prev.git prev.xclip ]
      ++ pkgs.lib.optional prev.stdenv.isLinux prev.wl-clipboard);
    postFixup = ''
      wrapProgram $out/bin/gopass \
        --prefix PATH : "${wrapperPath}" \
        --set GOPASS_NO_REMINDER true
    '';
  };

  go-task =
    prev.go-task.overrideAttrs (finalAttrs: previousAttrs: { patches = [ ]; });

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
    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;

    postInstall = ''
      mv $out/bin/cmd $out/bin/localsend-go
    '';
  };

  airmtp = inputs.airmtp.packages.${system}.default;

  compose2nix = inputs.compose2nix.packages.${system}.default;

  bumblebee-status =
    prev.bumblebee-status.override { plugins = p: [ p.cpu p.nic p.pipewire ]; };
}
