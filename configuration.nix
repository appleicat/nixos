{ config, lib, pkgs, ... }:

{
  
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    nano
    micro
    kitty
  ];

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  hardware.opengl.enable = true;
  
}
