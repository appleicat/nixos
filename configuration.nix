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

  users.users.kitty = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  }

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  hardware.opengl.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
