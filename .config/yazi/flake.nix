{
  description = "Install Yazi and Dependencies";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachSystem (system: let
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      name = "my-yazi-flake";
      paths = with pkgs; [
        yazi
        poppler
        unar
        fzf
        fd
        ripgrep-all
        ffmpegthumbnailer
        jq
      ];
    };
  });
}
