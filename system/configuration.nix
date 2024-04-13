{ hostname, username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  imports = [
    ( import ./user.nix { inherit username; } )
    ( import ./boot.nix )
  ];
  networking.hostName = "${hostname}";
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "all" ];
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [ micro ];
  programs.git.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = "${stateVersion}";
}