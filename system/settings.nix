{ stateVersion }:
{
  system.stateVersion = "${stateVersion}";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}