{ pkgs, lib, config, ... }: {

  options = {
      plasma6-bundle.enable = 
          lib.mkEnableOption "enables plasma6-bundle";
  };

  config = lib.mkIf config.plasma6-bundle.enable {
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