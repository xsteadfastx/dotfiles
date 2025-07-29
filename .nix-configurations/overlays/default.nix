{ system, inputs, ... }:
final: prev: {
  # needed because there is a system gpg-agent and gpg from wrapped gopass mismatch
  gopass = prev.gopass.overrideAttrs rec {
    wrapperPath = prev.lib.makeBinPath (
      [
        prev.git
        prev.xclip
      ]
      ++ prev.lib.optional prev.stdenv.isLinux prev.wl-clipboard
    );
    postFixup = ''
      wrapProgram $out/bin/gopass \
        --prefix PATH : "${wrapperPath}" \
        --set GOPASS_NO_REMINDER true
    '';
  };

  go-task = prev.go-task.overrideAttrs (finalAttrs: previousAttrs: { patches = [ ]; });

  localsend-go = prev.buildGo123Module rec {
    pname = "localsend-go";
    version = "1.2.7";

    doCheck = false;

    src = prev.fetchFromGitHub {
      owner = "meowrain";
      repo = "localsend-go";
      rev = "v${version}";
      hash = "sha256-Aier2AhFVi0jJ34VQtCGvOw1mHmfHH6a2697iYyZggo=";
    };

    vendorHash = "sha256-LtYzNt5YmBJWFB6tIidy+4xzgXOwcmy0Yms3Ppx7ooY=";
    ldflags = [
      "-s"
      "-w"
    ];

    env.CGO_ENABLED = 0;
  };

  airmtp = inputs.airmtp.packages.${system}.default;

  compose2nix = inputs.compose2nix.packages.${system}.default;

  # bumblebee-status = (prev.callPackage ./bumblebee-status { }).override {
  bumblebee-status = prev.bumblebee-status.override {
    plugins = p: [
      p.cpu
      p.nic
      p.pipewire
    ];
  };

  quickemu = inputs.quickemu.packages.${system}.default;

  veilig = prev.buildGo123Module rec {
    pname = "veilig";
    version = "1.4.2";

    src = prev.fetchFromGitHub {
      owner = "noqqe";
      repo = "veilig";
      rev = "v${version}";
      hash = "sha256-zhFNBtEr1d425YJUKzOZE6AzMhM6n8wkzIPZ0NGms3k=";
    };

    vendorHash = "sha256-7s1duYsogz3YizYLsZ8Vcc1EiSq2gWf+eA++QCeSKjY=";
    ldflags = [
      "-s"
      "-w"
    ];
    env.CGO_ENABLED = 0;
  };

  # tinymediamanager = prev.callPackage ./tinymediamanager/package.nix { };

  agenix = inputs.agenix.packages.${system}.default;

  imagingedge4linux = prev.callPackage ./imagingedge4linux/package.nix { };

  importsony = prev.callPackage ./importsony/package.nix { };
  importsony-jpegs = prev.callPackage ./importsony-jpegs/package.nix { };

  xsaneGimp = prev.xsane.override { gimpSupport = true; };
}
