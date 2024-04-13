{ hostname, username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  imports = [
    ( import ./user.nix { inherit username; } )
    ( import ./boot.nix )
    ( import ./networking.nix { inherit hostname; } )
    ( import ./settings.nix { inherit stateVersion; } )
  ];
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
  environment.systemPackages = with pkgs; [ micro ];
  programs.git.enable = true;
  programs.zsh.enable = true;
}