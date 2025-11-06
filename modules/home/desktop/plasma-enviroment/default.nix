{ pkgs, lib, config, ... }: {

  options = {
      plasma-desktop.enable = 
          lib.mkEnableOption "enables plasma-destop";
  };

  config = lib.mkIf config.plasma-desktop.enable {
    home.packages = with pkgs; [
      kdePackages.discover
      kdePackages.kcalc
      kdePackages.kcharselect
      kdePackages.kclock
      kdePackages.kcolorchooser
      kdePackages.ksystemlog
      kdePackages.kolourpaint
    ];
  };
  
}