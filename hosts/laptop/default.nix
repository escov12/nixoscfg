{ config, lib, pkgs, ... }: {

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "twinkpad";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Hermosillo";

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
  
  # users

  #users.mutableUsers = false;
  users.users.root.hashedPassword = "!";
  escov.enable = true;

  # home manager

  home-manager = {
    users = {
      escov = import ../../homes/escov;
    };
  };

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
  plasma.enable = true;
  sddm.enable = true;
  flatpak.enable = true;

  # enabled programs

  firefox.enable = true;

  # other

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";

}