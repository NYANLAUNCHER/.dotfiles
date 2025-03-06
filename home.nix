{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "markiep";
  home.homeDirectory = "/home/markiep";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Terminal
    yazi
    zellij
    neovim
    luajit
    luarocks
    lua-language-server
    ffmpegthumbnailer
    poppler
    unar
    fzf
    fd
    ripgrep-all
    lf
    rtorrent
    # Graphical
    vieb
    blender
    grimp
    krita
    zathura
    mpv
    nsxiv
    f3d
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
