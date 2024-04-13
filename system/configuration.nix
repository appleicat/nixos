{ hostname, username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  imports = [
    ( import ./user.nix { inherit username; } )
    ( import ./boot.nix )
    ( import ./locale.nix )
    ( import ./power.nix )
    ( import ./sound.nix )
    ( import ./hardware.nix )
    ( import ./apps.nix )
    ( import ./networking.nix { inherit hostname; } )
    ( import ./settings.nix { inherit stateVersion; } )
  ];
}