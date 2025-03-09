{
  description = "Bootstrap my user environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachSystem (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    # The user environment package
    devShell = pkgs.mkShell {
      buildInputs = with pkgs; [
        # Terminal
        git
        lazygit
        yazi
        # Graphical
        vieb
        brave
        mpv
        nsxiv
        f3d
        zathura
        litemdview
      ];

      # Custom environment variables or shell configuration
      shellHook = ''
      '';
    };
  });
}
