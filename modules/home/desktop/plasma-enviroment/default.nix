{ pkgs, lib, config, ... }: {

  options = {
      plasma-enviroment.enable = 
          lib.mkEnableOption "enables plasma-enviroment";
  };

  config = lib.mkIf config.plasma-enviroment.enable {
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