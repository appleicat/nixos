{ hostname }:
{
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi = {
        backend = "iwd";
        macAddress = "random";
      };
    };
  };
}