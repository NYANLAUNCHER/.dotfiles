{
  description = "Bootstrap my user environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
    neovim.url = "path:./.config/nvim";
    yazi.url = "path:./.config/yazi";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      # The user environment package
      paths = with pkgs; [
        neovim
        yazi
        # Terminal
        lf
        gh
        lazygit
        direnv
        zellij
        neomutt
        tree
        libqalculate
        ytfzf
        # Graphical
        #ghostty
        vieb
        brave
        mpv
        nsxiv
        f3d
        zathura
        #litemdview
      ];
    };
  });
}
