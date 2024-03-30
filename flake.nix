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
                  settings = {
                    main = {
                      layer = "top";
                      position = "top";
                      height = 30;
                      spacing = 5;
                      modules-left = [
                        "hyprland/workspaces"
                      ];
                      modules-center = [
                        "clock"
                      ];
                      modules-right = [
                        "disk"
                        "memory"
                        "cpu"
                        "backlight"
                        "battery"
                      ];
                    };
                  };
                  style = ''
                    * {
                      background-color: transparent;
                      color: white;
                      border: none;
                      border-radius: 0;
                      font-family: Iosevka;
                    }
                    window#waybar {
                      background-color: black;
                      color: white;
                    }
                    tooltip {
                      background-color: black;
                    }
                    tooltip label {
                      color: white;
                    }
                  '';
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
                        "disable_while_typing" = "true";
                      };
                    };
                    general = {
                      "border_size" = "3";
                      "gaps_in" = "3";
                      "gaps_out" = "5";
                      "col.active_border" = "rgba(FFFFFFFF)";
                      "col.inactive_border" = "rgba(FFFFFF00)";
                      "no_cursor_warps" = "true";
                    };
                    "$MOD" = "SUPER";
                    "$TERM" = "kitty";
                    bind = [
                      "$MOD, RETURN, exec, $TERM"
                      
                      "$MOD+CTRL, B, exec, $TERM btop"
                      "$MOD+CTRL, H, exec, $TERM htop"
                      
                      "$MOD, C, exec, chromium"
                      
                      "$MOD+SHIFT, Q, killactive"
                      "$MOD+SHIFT, SPACE, togglefloating"
                      "$MOD+SHIFT, P, pin"
                      "$MOD+SHIFT, F, fullscreen"
                      
                      "$MOD, UP, movefocus, u"
                      "$MOD, DOWN, movefocus, d"
                      "$MOD, LEFT, movefocus, l"
                      "$MOD, RIGHT, movefocus, r"
                      
                      "$MOD+SHIFT, UP, movewindow, u"
                      "$MOD+SHIFT, DOWN, movewindow, d"
                      "$MOD+SHIFT, LEFT, movewindow, l"
                      "$MOD+SHIFT, RIGHT, movewindow, r"
                      
                      "$MOD+CTRL, UP, togglespecialworkspace"
                      "$MOD+CTRL, DOWN, togglespecialworkspace"
                      "$MOD+CTRL, LEFT, workspace, -1"
                      "$MOD+CTRL, RIGHT, workspace, +1"
                      
                      "$MOD+SHIFT+CTRL, UP, movetoworkspace, special"
                      "$MOD+SHIFT+CTRL, DOWN, movetoworkspace, +0"
                      "$MOD+SHIFT+CTRL, LEFT, movetoworkspace, -1"
                      "$MOD+SHIFT+CTRL, RIGHT, movetoworkspace, +1"
                      
                      "ALT, TAB, cyclenext"
                      
                      "$MOD+SHIFT+CTRL, Q, exit"
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
