{
  description = "My user environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # You can choose stable or unstable branches
    flake-utils.url = "github:numtide/flake-utils";
    neovim.url = "github:NYANLAUNCHER/nvim";
    #yazi.url = "github:NYANLAUNCHER/yazi";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }@inputs: flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      # The user environment package
      name = "my-user-profile";
      paths = [
        #inputs.neovim.packages.${system}.default
        #inputs.yazi.packages.${system}.default
      ] ++ (with pkgs; [
        # Terminal
        neovim
        yazi
        gh
        lazygit
        direnv
        neomutt
        libqalculate
        ytfzf
        # Graphical
        brave
        ghostty
        mpv
        nsxiv
        zathura
        f3d
      ]);
    };
  });
}
