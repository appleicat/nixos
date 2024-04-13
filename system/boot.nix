{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 #boot.plymouth.enable = true;
 #boot.consoleLogLevel = 0;
 #boot.initrd.verbose = false;
 #boot.kernelParams = [ "quiet" "udev.log_level=3" ];
  boot.loader.timeout = 0;
}