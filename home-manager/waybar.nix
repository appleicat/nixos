{
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
}