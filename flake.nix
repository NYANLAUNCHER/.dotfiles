{
  description = "My user environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
    neovim.url = "path:.config/nvim";
    yazi.url = "path:.config/yazi";
    vieb.url = "path:.config/vieb";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: 
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      # The user environment package
      name = "my-user-profile";
      paths = with pkgs; [
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
        ghostty
        brave
        mpv
        nsxiv
        zathura
        f3d
        #litemdview
      ];
    };
  });
}
