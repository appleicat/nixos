{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, ... }: {
              boot.loader.systemd-boot.enable = true;
              boot.loader.efi.canTouchEfiVariables = true;
             #boot.plymouth.enable = true;
             #boot.consoleLogLevel = 0;
             #boot.initrd.verbose = false;
             #boot.kernelParams = [ "quiet" "udev.log_level=3" ];
              boot.loader.timeout = 0;
              networking.hostName = "nixos";
              networking.wireless.iwd.enable = true;
              networking.networkmanager.enable = true;
              networking.networkmanager.wifi.backend = "iwd";
              hardware.opengl = {
                enable = true;
                driSupport = true;
                driSupport32Bit = true;
              };
              sound.enable = true;
              services.pipewire = {
                enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                pulse.enable = true;
                jack.enable = true;
              };
              powerManagement = {
                enable = true;
                powertop.enable = true;
              };
              i18n = {
                defaultLocale = "en_US.UTF-8";
                supportedLocales = [ "all" ];
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
            nixpkgs.config.input-fonts.acceptLicense = true;
            home-manager.users.kitty = (
              { pkgs, ... }: {
                home.username = "kitty";
                home.homeDirectory = "/home/kitty";
                fonts.fontconfig.enable = true;
                home.packages = with pkgs; [
                  monaspace
                  powerline
                  iosevka
                  cozette
                  input-fonts
                  noto-fonts
                  brightnessctl
                  cmatrix
                  neofetch
                  tty-clock
                  swww
                  mpvpaper
                  bun
                  deno
                  nodejs
                 #warp-terminal
                 #hyper
                  discord
                  vesktop
                  cmus
                  ffmpeg-full
                  fim
                  timg
                  catimg
                  grim
                  slurp
                  wf-recorder
                 #qemu
                 #retroarchFull
                  mc
                ];
                home.pointerCursor = {
                  package = pkgs.apple-cursor;
                  name = "macOS-Monterey-White";
                  size = 16;
                  gtk.enable = true;
                  x11.enable = true;
                };
                programs.zsh = {
                  enable = true;
                  shellAliases = {
                    H = "Hyprland";
                  };
                  oh-my-zsh = {
                    enable = true;
                    theme = "robbyrussell";
                    plugins = [ "git" "sudo" "themes" ];
                  };
                };
                programs.btop = {
                  enable = true;
                };
                programs.htop = {
                  enable = true;
                };
                programs.tmux = {
                  enable = true;
                };
                programs.eza = {
                  enable = true;
                };
                programs.kitty = {
                  enable = true;
                  font = {
                    package = pkgs.iosevka;
                    name = "Iosevka";
                    size = 10;
                  };
                  settings = {
                    "enable_audio_bell" = "no";
                    "draw_minimal_borders" = "no";
                    "window_border_width" = "0px";
                    "window_padding_width" = "10";
                    "foreground" = "#eeeeee";
                    "background" = "#000000";
                  };
                };
                programs.alacritty = {
                  enable = true;
                  settings = {
                    window = {
                      padding = {
                        x = 15;
                        y = 15;
                      };
                      dynamic_padding = true;
                      decorations = "None";
                      dynamic_title = true;
                    };
                    font = {
                      normal = {
                        family = "Iosevka";
                      };
                      size = 13;
                      offset = {
                        x = 0;
                        y = 0;
                      };
                    };
                    colors = {
                      primary = {
                        foreground = "#FFFFFF";
                        background = "#000000";
                      };
                      cursor = {
                        text = "CellBackground";
                        cursor = "CellForeground";
                      };
                      transparent_background_colors = true;
                     #primary = {
                     #  foreground = "#CDD6F4";
                     #  dim_foreground = "#CDD6F4";
                     #  bright_foreground = "#CDD6F4";
                     #  background = "#1E1E2E";
                     #};
                     #cursor = {
                     #  text = "#1E1E2E";
                     #  cursor = "#F5E0DC";
                     #};
                      vi_mode_cursor = {
                        text = "#1E1E2E";
                        cursor = "#B4BEFE";
                      };
                      search = {
                        matches = {
                          foreground = "#1E1E2E";
                          background = "#A6ADC8";
                        };
                        focused_match = {
                          foreground = "#1E1E2E";
                          background = "#A6E3A1";
                        };
                      };
                      footer_bar = {
                        foreground = "#1E1E2E";
                        background = "#A6ADC8";
                      };
                      hints = {
                        start = {
                          foreground = "#1E1E2E";
                          background = "#F9E2AF";
                        };
                        end = {
                          foreground = "#1E1E2E";
                          background = "#A6ADC8";
                        };
                      };
                      selection = {
                        text = "#1E1E2E";
                        background = "#F5E0DC";
                      };
                      normal = {
                        black = "#45475A";
                        red = "#F38BA8";
                        green = "#A6E3A1";
                        yellow = "#F9E2AF";
                        blue = "#89B4FA";
                        magenta = "#F5C2E7";
                        cyan = "#94E2D5";
                        white = "#BAC2DE";
                      };
                      bright = {
                        black = "#585B70";
                        red = "#F38BA8";
                        green = "#A6E3A1";
                        yellow = "#F9E2AF";
                        blue = "#89B4FA";
                        magenta = "#F5C2E7";
                        cyan = "#94E2D5";
                        white = "#A6ADC8";
                      };
                      dim = {
                        black = "#45475A";
                        red = "#F38BA8";
                        green = "#A6E3A1";
                        yellow = "#F9E2AF";
                        blue = "#89B4FA";
                        magenta = "#F5C2E7";
                        cyan = "#94E2D5";
                        white = "#BAC2DE";
                      };
                    };
                    cursor = {
                      style = {
                        shape = "Block";
                        blinking = "Off";
                      };
                    };
                  };
                };
               #programs.wezterm = {
               #  enable = true;
               #};
               #programs.foot = {
               #  enable = true;
               #};
                programs.cava = {
                  enable = true;
                  settings = {
                    general = {
                      autosens = 1;
                      lower_cutoff_freq = 20;
                      higher_cutoff_freq = 20000;
                    };
                    output = {
                      channels = "mono";
                      mono_option = "average";
                      alacritty_sync = 1;
                    };
                    smoothing = {
                      monstercat = 1;
                      waves = 0;
                      noise_reduction = 33;
                    };
                  };
                };
                programs.ranger = {
                  enable = true;
                };
                programs.lf = {
                  enable = true;
                };
                programs.yazi = {
                  enable = true;
                };
                programs.bat = {
                  enable = true;
                };
                programs.micro = {
                  enable = true;
                  settings = {
                    colorscheme = "monokai-dark";
                    infobar = false;
                    statusline = true;
                    tabstospaces = true;
                    tabsize = 2;
                    ruler = true;
                  };
                };
                programs.helix = {
                  enable = true;
                };
                programs.vscode = {
                  enable = true;
                };
               #services.mpd = { enable = true; };
                programs.ncmpcpp = {
                  enable = true;
                };
                programs.mpv = {
                  enable = true;
                };
                programs.bemenu = {
                  enable = true;
                };
                programs.chromium = {
                  enable = true;
                };
                programs.firefox = {
                  enable = true;
                };
                services.mako = {
                  enable = true;
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
                        "format" = "{:%A %d %B %Y %H:%M:%S}";
                        "format-alt" = "{:%H:%M}";
                        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
                      };
                      "battery" = {
                        "format" = "BAT {capacity}";
                        "format-alt" = "B{capacity}";
                      };
                      "cpu" = {
                        "interval" = 1;
                        "format" = "CPU {usage}";
                        "format-alt" = "C{usage}";
                      };
                      "memory" = {
                        "interval" = 10;
                        "format" = "MEM {percentage}";
                        "format-alt" = "M{percentage}";
                      };
                      "temperature" = {
                        "interval" = 10;
                        "format" = "TEMP {temperatureC}";
                        "format-alt" = "T{temperatureC}";
                      };
                      "network" = {
                        "interval" = 1;
                        "format" = "{ifname}";
                        "format-wifi" = "{essid}";
                        "format-ethernet" = "{ipaddr}/{cidr}";
                        "format-disconnected" = "NO NETWORK";
                        "tooltip-format" = "{ifname} via {gwaddr}";
                        "tooltip-format-wifi" = "Strength: {signalStrength}%\nSignal: {signaldBm}dBm\n  UP: {bandwidthUpBytes}\nDOWN: {bandwidthDownBytes}";
                        "tooltip-format-ethernet" = "{ifname}";
                        "tooltip-disconnected" = "DISCONNECTED";
                      };
                      "backlight" = {
                        "format" = "LIGHT {percent}";
                        "format-alt" = "L{percent}";
                      };
                      "wireplumber" = {
                        "format" = "AUDIO {volume}";
                        "format-alt" = "A{volume}";
                      };
                      "disk" = {
                        "format" = "DISK {percentage_used}";
                        "format-alt" = "D{percentage_used}";
                      };
                      "hyprland/workspaces" = {
                        "format" = "{windows}";
                        "format-window-separator" = " | ";
                        "window-rewrite" = {
                          "class<kitty> title" = "{title}";
                          "class<Alacritty> title" = "{title}";
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
                      font-weight: 300;
                      text-shadow: none;
                    }
                    window#waybar {
                      background-color: transparent;
                    }
                    tooltip {
                      background-color: white;
                    }
                    tooltip label {
                      color: black;
                    }
                    .modules-left, .modules-center, .modules-right {
                      margin-top: 5px;
                      margin-left: 5px;
                      margin-right: 5px;
                      margin-bottom: 0px;
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
                    #privacy {
                      background-color: white;
                      color: black;
                      padding: 0 10px;
                    }
                    #workspaces {
                      background-color: transparent;
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
                      background-color: transparent;
                      color: rgba(255,255,255,0);
                    }
                  '';
                };
                wayland.windowManager.hyprland = {
                  enable = true;
                  settings = {
                    exec-once = [
                      "waybar"
                      "swww-daemon"
                    ];
                    misc = {
                      "disable_hyprland_logo" = "true";
                      "force_default_wallpaper" = "0";
                      "background_color" = "0x000000";
                    };
                    dwindle = {
                      "no_gaps_when_only" = "0";
                      "smart_split" = "true";
                    };
                    input = {
                      "kb_layout" = "us";
                      "kb_options" = "grp:win_space_toggle";
                      touchpad = {
                        "natural_scroll" = "true";
                        "disable_while_typing" = "true";
                        "scroll_factor" = "0.3";
                      };
                    };
                    general = {
                      "border_size" = "3";
                      "gaps_in" = "3";
                      "gaps_out" = "5";
                      "col.active_border" = "rgba(FFFFFFFF)";
                      "col.inactive_border" = "rgba(FFFFFF00)";
                      "no_cursor_warps" = "true";
                      "cursor_inactive_timeout" = "60";
                    };
                    decoration = {
                      "rounding" = "0";
                      "active_opacity" = "1.0";
                      "inactive_opacity" = "1.0";
                      "fullscreen_opacity" = "1.0";
                      "dim_inactive" = "false";
                      "dim_strength" = "0.1";
                      "dim_special" = "0.3";
                      "drop_shadow" = "false";
                      "blur" = {
                        "enabled" = "false";
                        "size" = "4";
                        "passes" = "4";
                        "ignore_opacity" = "true";
                      };
                    };
                   #windowrulev2 = [
                   #  "opacity 0.77, class:(kitty|Alacritty)"
                   #];
                    "$MOD" = "SUPER";
                    "$TERM" = "alacritty";
                    bind = [
                      "$MOD+ALT, RETURN, exec, kitty"
                      "$MOD, RETURN, exec, alacritty"
                      
                      "$MOD, ESCAPE, exec, hyprctl kill"
                      
                      "$MOD, Q, killactive"
                      "$MOD, T, exec, $TERM"
                      "$MOD, C, exec, chromium"
                      "$MOD, V, exec, code"
                      "$MOD, F, fullscreen"
                      "$MOD, D, exec, discord"
                      "$MOD, S, togglesplit"
                      "$MOD, R, exec, bemenu-run -i -p ' RUN' -M '5' -H '32' -n --hp '5' --fn 'Iosevka Light 11' --single-instance --ff '##000000' --fb '##FFFFFF' --tb '##FFFFFF' --tf '##000000' --cb '##FFFFFF' --cf '##000000' --hb '##000000' --hf '##FFFFFF' --ab '##FFFFFF' --nb '##FFFFFF' --nf '##000000' --af '##000000'"
                      "$MOD+ALT, R, exec, bemenu-run -i -p ' RUN' -M '5' --hp '5' --fn 'Cozette 8' --single-instance --ff '##000000' --fb '##FFFFFF' --tb '##FFFFFF' --tf '##000000' --cb '##FFFFFF' --cf '##000000' --hb '##000000' --hf '##FFFFFF' --ab '##FFFFFF' --nb '##FFFFFF' --nf '##000000' --af '##000000'"
                      
                      "$MOD+CTRL, B, exec, alacritty -e btop"
                      "$MOD+CTRL, H, exec, alacritty -e htop"
                      "$MOD+CTRL, R, exec, alacritty -e ranger"
                      "$MOD+CTRL, L, exec, alacritty -e lf"
                      "$MOD+CTRL, Y, exec, EDITOR=micro alacritty -e yazi"
                      
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
                      
                      "$MOD+SHIFT+ALT, UP, moveactive, 0 -15"
                      "$MOD+SHIFT+ALT, UP, resizeactive, 0 30"
                      "$MOD+SHIFT+ALT, DOWN, moveactive, 0 15"
                      "$MOD+SHIFT+ALT, DOWN, resizeactive, 0 -30"
                      "$MOD+SHIFT+ALT, LEFT, moveactive, 15 0"
                      "$MOD+SHIFT+ALT, LEFT, resizeactive, -30 0"
                      "$MOD+SHIFT+ALT, RIGHT, moveactive, -15 0"
                      "$MOD+SHIFT+ALT, RIGHT, resizeactive, 30 0"
                      
                      "$MOD+ALT, C, centerwindow"
                      
                      "$MOD+CTRL, UP, togglespecialworkspace"
                      "$MOD+CTRL, DOWN, togglespecialworkspace"
                      "$MOD+CTRL, LEFT, workspace, -1"
                      "$MOD+CTRL, RIGHT, workspace, +1"
                      
                      "$MOD+SHIFT+CTRL, UP, movetoworkspace, special"
                      "$MOD+SHIFT+CTRL, DOWN, movetoworkspace, +0"
                      "$MOD+SHIFT+CTRL, LEFT, movetoworkspace, -1"
                      "$MOD+SHIFT+CTRL, RIGHT, movetoworkspace, +1"
                      
                      "ALT, TAB, cyclenext"
                      
                      "$MOD+SHIFT+ALT+CTRL, Q, exit"
                      "$MOD+SHIFT+ALT+CTRL, R, exec, reboot"
                      "$MOD+SHIFT+ALT+CTRL, S, exec, shutdown now"
                    ];
                    binde = [
                      "$MOD+ALT, UP, splitratio, -0.1"
                      "$MOD+ALT, LEFT, splitratio, -0.1"
                      "$MOD+ALT, DOWN, splitratio, 0.1"
                      "$MOD+ALT, RIGHT, splitratio, 0.1"
                      
                      "$MOD+ALT, UP, moveactive, 0 -10"
                      "$MOD+ALT, DOWN, moveactive, 0 10"
                      "$MOD+ALT, LEFT, moveactive, -10 0"
                      "$MOD+ALT, RIGHT, moveactive, 10 0"
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
