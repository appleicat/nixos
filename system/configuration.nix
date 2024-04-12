{ hostname, username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 #boot.plymouth.enable = true;
 #boot.consoleLogLevel = 0;
 #boot.initrd.verbose = false;
 #boot.kernelParams = [ "quiet" "udev.log_level=3" ];
  boot.loader.timeout = 0;
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
 #environment.systemPackages = with pkgs; [ ];
  programs.git.enable = true;
  programs.micro.enable = true;
  programs.zsh.enable = true;
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };
  system.stateVersion = "${stateVersion}";
}