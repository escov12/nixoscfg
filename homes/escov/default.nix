{ config, pkgs, ... }:

{

    imports =
    [ 
      ../../modules
    ];

  home.username = "escov";
  home.homeDirectory = "/home/escov";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName  = "escov12";
    userEmail = "182456839+escov12@users.noreply.github.com";
  };

  home.packages = with pkgs; [
    neovim
    wget
    git
    vscodium
    libreoffice-fresh
  ];

  plasma-desktop.enable = true;


  home.file = {

  };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

}
