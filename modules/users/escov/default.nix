{ pkgs, lib, config, ... }: {

    options = {
        escov.enable = 
            lib.mkEnableOption "enables escov user";
    };

    config = lib.mkIf config.escov.enable {
      users.users.escov = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };

}