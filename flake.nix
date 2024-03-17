{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { config, lib, pkgs, ... }:
            {
              boot.loader.systemd-boot.enable = true;
              boot.loader.efi.canTouchEfiVariables = true;
              networking.hostName = "nixos";
              networking.networkmanager.enable = true;
              environment.systemPackages = with pkgs; [
                git
                micro
                kitty
              ];
              users.defaultUserShell = pkgs.zsh;
              users.users.kitty = {
                isNormalUser = true;
                extraGroups = [ "wheel" "networkmanager" ];
              };
              programs.zsh = {
                enable = true;
                ohMyZsh = {
                  enable = true;
                };
              };
              programs.hyprland.enable = true;
              programs.hyprland.xwayland.enable = true;
              hardware.opengl.enable = true;
              nixpkgs.config.allowUnfree = true;
              nix.settings.experimental-features = [ "nix-command" "flakes" ];
            }
          )
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
           #home-manager.users.kitty = import ./home.nix;
          }
        ];
      };
    };
  };
}
