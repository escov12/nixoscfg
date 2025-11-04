{pkgs, lib, ... }: {

  imports = [
    ./pipewire.nix
    ./plasma6.nix
    ./sddm.nix
  ];

}