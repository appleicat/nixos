{ stateVersion }:
{
  system.stateVersion = "${stateVersion}";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}