{ pkgs ? import <nixpkgs> {}, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    monaspace
    powerline
    iosevka
    cozette
    ( input-fonts.override { acceptLicense = true; } )
    noto-fonts
    noto-fonts-emoji
    jetbrains-mono
  ];
}