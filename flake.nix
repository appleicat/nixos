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
          ( { config, lib, pkgs, ... }: {
              boot.loader.systemd-boot.enable = true;
              boot.loader.efi.canTouchEfiVariables = true;
              networking.hostName = "nixos";
              networking.networkmanager.enable = true;
              hardware.opengl.enable = true;
              nixpkgs.config.allowUnfree = true;
              nix.settings.experimental-features = [ "nix-command" "flakes" ];
              environment.systemPackages = with pkgs; [ git micro ];
              programs.zsh.enable = true;
              users.users.kitty = {
                isNormalUser = true;
                extraGroups = [ "wheel" "networkmanager" ];
                shell = pkgs.zsh;
              };
            }
          )
          ( ./hardware-configuration.nix )
          ( home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kitty = (
                { config, pkgs, ... }: {
                  home.username = "kitty";
                  home.homeDirectory = "/home/kitty";
                  fonts.fontconfig.enable = true;
                  home.packages = with pkgs; [
                    powerline
                    iosevka
                  ];
                  programs.zsh = {
                    enable = true;
                    oh-my-zsh = {
                      enable = true;
                    };
                  };
                  programs.btop = {
                    enable = true;
                  };
                  programs.kitty = {
                    enable = true;
                  };
                  programs.waybar = {
                    enable = true;
                  };
                  wayland.windowManager.hyprland = {
                    enable = true;
                    xwayland.enable = true;
                  };
                }
              );
            }
          )
        ];
      };
    };
  };
}
