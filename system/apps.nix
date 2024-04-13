{ pkgs ? import <nixpkgs> {}, ... }:
{
  environment.systemPackages = with pkgs; [ micro ];
  programs.git.enable = true;
  programs.zsh.enable = true;
}