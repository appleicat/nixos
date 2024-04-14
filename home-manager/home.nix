{ username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }: 
{
  imports = [
    ( import ./fonts.nix )
    ( import ./apps.nix )
    ( import ./pointer.nix )
    ( import ./kitty.nix )
    ( import ./alacritty.nix )
    ( import ./foot.nix )
    ( import ./zsh.nix )
    ( import ./cava.nix )
    ( import ./waybar.nix )
    ( import ./hyprland.nix )
    ( import ./settings.nix { inherit username stateVersion; } )
  ];
}