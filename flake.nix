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
              boot.plymouth.enable = true;
              boot.consoleLogLevel = 0;
              boot.initrd.verbose = false;
              boot.kernelParams = [ "quiet" "udev.log_level=3" ];
              boot.loader.timeout = 0;
              networking.hostName = "nixos";
              networking.networkmanager.enable = true;
              hardware.opengl.enable = true;
              services.pipewire = {
                enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                pulse.enable = true;
                jack.enable = true;
              };
              nixpkgs.config.allowUnfree = true;
              nix.settings.experimental-features = [ "nix-command" "flakes" ];
              environment.systemPackages = with pkgs; [ git micro ];
              programs.zsh.enable = true;
              users.users.kitty = {
                isNormalUser = true;
                extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
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
                  brightnessctl
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
                  font = {
                    package = pkgs.iosevka;
                    name = "Iosevka";
                  };
                };
                programs.waybar = {
                  enable = true;
                  settings = {
                    main = {
                      layer = "top";
                      position = "top";
                      height = 32;
                      spacing = 5;
                      modules-left = [
                        "hyprland/workspaces"
                      ];
                      modules-center = [];
                      modules-right = [
                        "network"
                        "wireplumber"
                        "backlight"
                        "temperature"
                        "disk"
                        "memory"
                        "cpu"
                        "battery"
                        "clock"
                        "privacy"
                      ];
                      "clock" = {
                        "interval" = 1;
                        "format-alt" = "{:%A %d %B %Y %H:%M:%S}";
                        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
                      };
                      "battery" = {
                        "format" = "BAT {capacity}";
                      };
                      "cpu" = {
                        "interval" = 1;
                        "format" = "CPU {usage}";
                      };
                      "memory" = {
                        "interval" = 10;
                        "format" = "MEM {percentage}";
                      };
                      "temperature" = {
                        "interval" = 10;
                        "format" = "TEMP {temperatureC}";
                      };
                      "network" = {
                        "format" = "{ifname}";
                        "format-wifi" = "{essid}";
                        "format-ethernet" = "{ipaddr}/{cidr}";
                        "format-disconnected" = "NO NETWORK";
                        "tooltip-format" = "{ifname} via {gwaddr}";
                        "tooltip-format-wifi" = "{essid}\nStrength: {signalStrength}%\nSignal: {signaldBm}dBm";
                        "tooltip-format-ethernet" = "{ifname}";
                        "tooltip-disconnected" = "DISCONNECTED";
                      };
                      "backlight" = {
                        "format" = "LIGHT {percent}";
                      };
                      "wireplumber" = {
                        "format" = "AUDIO {volume}";
                      };
                      "disk" = {
                        "format" = "DISK {percentage_used}";
                      };
                      "hyprland/workspaces" = {
                        "format" = "[ {windows} ]";
                        "format-window-separator" = " | ";
                        "window-rewrite" = {
                          "class<kitty> title" = "{title}";
                          "class" = "{class}";
                        };
                      };
                    };
                  };
                  style = ''
                    * {
                      background-color: transparent;
                      border: none;
                      border-radius: 0;
                      font-family: Iosevka;
                    }
                    window#waybar {
                      background-color: black;
                    }
                    tooltip {
                      background-color: white;
                    }
                    tooltip label {
                      color: black;
                      font-weight: 300;
                    }
                    .modules-left, .modules-center, .modules-right {
                      margin: 0 5px;
                    }
                    #clock,
                    #battery,
                    #cpu,
                    #memory,
                    #temperature,
                    #network,
                    #backlight,
                    #wireplumber,
                    #disk,
                    #privacy, {
                      background-color: white;
                      color: black;
                      padding: 0 10px;
                    }
                    #workspaces {
                      background-color: black;
                    }
                    #workspaces button {
                      background-color: black;
                      color: white;
                    }
                    #workspaces button:hover {
                      background-color: white;
                      color: black;
                    }
                    #workspaces button.active {
                      background-color: white;
                      color: black;
                    }
                    #workspaces button.empty {
                      background-color: black;
                      color: rgba(255,255,255,0);
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
                      "force_default_wallpaper" = "0";
                    };
                    dwindle = {
                      "no_gaps_when_only" = "1";
                      "smart_split" = "true";
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
                      
                      "$MOD, Q, killactive"
                      "$MOD+SHIFT, Q, killactive"
                      "$MOD+SHIFT, SPACE, togglefloating"
                      "$MOD+SHIFT, P, pin"
                      "$MOD+SHIFT, F, fullscreen"
                      "$MOD+ALT, S, togglesplit"
                      
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
                    binde = [
                      "$MOD+ALT, UP, splitratio, -0.1"
                      "$MOD+ALT, LEFT, splitratio, -0.1"
                      "$MOD+ALT, DOWN, splitratio, 0.1"
                      "$MOD+ALT, RIGHT, splitratio, 0.1"
                    ];
                    bindle = [
                      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
                      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
                    ];
                    bindm = [
                      "$MOD, mouse:272, movewindow"
                      "$MOD, mouse:273, resizewindow"
                      "$MOD+ALT, mouse:272, resizewindow"
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
