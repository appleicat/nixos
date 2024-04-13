{ pkgs ? import <nixpkgs> {}, ... }:
{
  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS-Monterey-White";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };
}