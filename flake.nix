{
  description = "Flake to bootstrap home directory";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # Get a list of files tracked by Git
      gitTrackedFiles = builtins.toList (builtins.filter (path: builtins.substring 0 11 path == "./config/") (builtins.splitString "\n" (builtins.fetchurl {
        url = "git+file://${toString ./}";
        sha256 = "0v...";  # Replace with the actual hash if necessary
      })));
      # Find all files matching the pattern in the config directory
      homeManagerNixFiles = builtins.filter (file: builtins.elem file gitTrackedFiles) (builtins.glob "./config/**/home-manager.nix");
    in {
      homeConfigurations."markiep" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = homeManagerNixFile;

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
