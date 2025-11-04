{ pkgs, lib, config, ... }: {

    options = {
        plasma.enable =
            lib.mkEnableOption "enables plasma";
    };

    config = lib.mkIf config.plasma.enable {
      services.desktopManager.plasma6.enable = true;

    };

}