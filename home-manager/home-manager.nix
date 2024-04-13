{ username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."${username}" = ( import ./home.nix { inherit username stateVersion; } );
}