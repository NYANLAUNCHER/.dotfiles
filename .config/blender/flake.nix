{
  description = "Nix flake to install Blender";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";  # Use the latest nixpkgs

  outputs = { self, nixpkgs }:
  let
    pkgs=nixpkgs;
  in {
    packages = {
      default = pkgs.lib.mkApp {
        pname = "blender";
        version = "latest";
        buildInputs = [
          pkgs.pkgs.blender
        ];
        meta.description = "A 3D creation suite.";
      };
    };

    defaultPackage.x86_64-linux = self.packages.default;
    defaultApp.x86_64-linux = self.packages.default;

    devShell.x86_64-linux = pkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [ pkgs.legacyPackages.x86_64-linux.blender ];
    };
  };
}
