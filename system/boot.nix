{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
   #plymouth.enable = true;
   #consoleLogLevel = 0;
   #initrd.verbose = false;
   #kernelParams = [ "quiet" "udev.log_level=3" ];
  };
}