{
  description = "my nixops & ansible configruation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { self, nixpkgs, flake-utils, nix-gaming }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        buildInputs = [ nix-gaming.packages.${pkgs.system}.star-citizen ];
      };
    });
}
