{ system, inputs, ... }:
final: prev: {

  # up to date neovim
  # neovim = prev.neovim-unwrapped.overrideAttrs {
  #   src = prev.fetchFromGitHub {
  #     owner = "neovim";
  #     repo = "neovim";
  #     rev = "v0.10.3";
  #     hash = "sha256-nmnEyHE/HcrwK+CyJHNoLG0BqjnWleiBy0UYcJL7Ecc=";
  #   };
  # };

  # needed because there is a system gpg-agent and gpg from wrapped gopass mismatch
  gopass = prev.gopass.overrideAttrs rec {
    wrapperPath = prev.lib.makeBinPath ([ prev.git prev.xclip ]
      ++ prev.lib.optional prev.stdenv.isLinux prev.wl-clipboard);
    postFixup = ''
      wrapProgram $out/bin/gopass \
        --prefix PATH : "${wrapperPath}" \
        --set GOPASS_NO_REMINDER true
    '';
  };

  go-task =
    prev.go-task.overrideAttrs (finalAttrs: previousAttrs: { patches = [ ]; });

  localsend-go = prev.buildGo123Module {
    pname = "localsend-go";
    version = "1.2.0";

    src = prev.fetchFromGitHub {
      owner = "meowrain";
      repo = "localsend-go";
      rev = "6f3dec9";
      hash = "sha256-NxR5fn9h3a3qXYfJJLqqKiyUazEoqstZYpAfhD02Ai8=";
    };

    vendorHash = "sha256-2R8L+CIJKRGcX19udw60eM1Qwpo2RXDWL6N8s7lVN8s=";
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
