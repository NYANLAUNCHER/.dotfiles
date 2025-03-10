{
  description = "EVE Online setup using Wine with Nix Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can adjust the version if needed
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    defaultPackage = pkgs.stdenv.mkDerivation {
      pname = "eve-online";
      version = "1.0";
      
      src = null;  # Source code not needed since we are using Wine

      buildInputs = [ pkgs.wine pkgs.stdenv ];

      # Wine and other necessary dependencies for running the game
      #nativeBuildInputs = [ pkgs.x11 ];

      installPhase = ''
        mkdir -p $out
        # Download and install EVE Online client if needed, or simply set up Wine
        echo "EVE Online will be installed via Wine"
      '';
    };
  });
}
