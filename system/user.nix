{ username }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  programs.zsh.enable = true;
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };
}