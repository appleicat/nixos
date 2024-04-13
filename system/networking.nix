{ hostname }:
{
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}