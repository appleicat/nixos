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
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager {
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
                programs.htop = {
                  enable = true;
                };
                programs.kitty = {
                  enable = true;
                };
                programs.waybar = {
                  enable = true;
                };
                programs.chromium = {
                  enable = true;
                };
                wayland.windowManager.hyprland = {
                  enable = true;
                  settings = {
                    "exec-once" = "waybar";
                    misc = {
                      "disable_hyprland_logo" = "true";
                    };
                    dwindle = {
                      "no_gaps_when_only" = "1";
                    };
                    input = {
                      touchpad = {
                        "natural_scroll" = "yes";
                      };
                    };
                    general = {
                      "border_size" = "3";
                      "gaps_in" = "3";
                      "gaps_out" = "5";
                      "col.active_border" = "rgba(FFFFFFFF)";
                      "col.inactive_border" = "rgba(FFFFFF00)";
                    };
                    "$MOD" = "SUPER";
                    "$TERM" = "kitty";
                    bind = [
                      "$MOD, RETURN, exec, $TERM"
                      
                      "$MOD+CTRL, B, exec, $TERM btop"
                      "$MOD+CTRL, H, exec, $TERM htop"
                      
                      "$MOD, C, exec, chromium"
                      
                      "$MOD+SHIFT, Q, killactive,"
                      "$MOD+SHIFT, SPACE, togglefloating,"
                      "$MOD+SHIFT, F, fullscreen,"
                      
                      "$MOD, UP, movefocus, u"
                      "$MOD, DOWN, movefocus, d"
                      "$MOD, LEFT, movefocus, l"
                      "$MOD, RIGHT, movefocus, r"
                      
                      "$MOD+CTRL, LEFT, workspace, -1"
                      "$MOD+CTRL, RIGHT, workspace, +1"
                      
                      "$MOD+SHIFT+CTRL, LEFT, movetoworkspace, -1"
                      "$MOD+SHIFT+CTRL, RIGHT, movetoworkspace, +1"
                      
                      "$MOD+SHIFT+CTRL, Q, exit,"
                    ];
                    bindm = [
                      "$MOD, mouse:272, movewindow"
                      "$MOD, mouse:273, resizewindow"
                      "$MOD+CTRL, mouse:272, resizewindow"
                    ];
                  };
                };
              }
            );
          }
        ];
      };
    };
  };
}
