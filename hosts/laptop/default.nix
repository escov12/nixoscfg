{ config, lib, pkgs, ... }: {

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system/services/default.nix
      ../../modules/system/programs/default.nix
      ../../modules/system/hardware/default.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "twinkpad";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Hermosillo";

  #users.mutableUsers = false;
  users.users.root.hashedPassword = "!";
  
  users.users.escov = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # home manager

  home-manager = {
    users = {
      escov = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  # firewall

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPortRanges = [  ];
  };

  # enabled hardware

  bluetooth.enable = true;

  # enabled services
  
  pipewire.enable = true;
  plasma6.enable = true;
  sddm.enable = true;

  # enabled programs

  firefox.enable = true;

  # other

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";

}