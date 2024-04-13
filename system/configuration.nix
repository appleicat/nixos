{ hostname, username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  imports = [
    ( import ./user.nix { inherit username; } )
    ( import ./boot.nix )
    ( import ./locale.nix )
    ( import ./power.nix )
    ( import ./hardware.nix )
    ( import ./apps.nix )
    ( import ./networking.nix { inherit hostname; } )
    ( import ./settings.nix { inherit stateVersion; } )
  ];
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}