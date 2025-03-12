{
  description = "Install Neovim and Dependencies";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachSystem (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    packages.default = pkgs.buildEnv {
      name = "my-neovim-flake";
      paths = with pkgs; [
        neovim
        luajit
        luarocks
        lua-language-server
        zig
      ];
    };
  });
}
