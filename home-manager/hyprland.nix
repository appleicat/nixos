{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
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
      "$MOD" = "SUPER";
      "$TERM" = "foot";
      bind = [
        "$MOD+ALT, RETURN, exec, alacritty"
        "$MOD, RETURN, exec, $TERM"
        
        "$MOD, ESCAPE, exec, hyprctl kill"
        
        "$MOD, Q, killactive"
        "$MOD, F, fullscreen"
        "$MOD, S, togglesplit"
        
        "$MOD, R, exec, bemenu-run -i -p ' RUN' -M '5' -H '32' -n --hp '5' --fn 'Iosevka Light 11' --single-instance --ff '##000000' --fb '##FFFFFF' --tb '##FFFFFF' --tf '##000000' --cb '##FFFFFF' --cf '##000000' --hb '##000000' --hf '##FFFFFF' --ab '##FFFFFF' --nb '##FFFFFF' --nf '##000000' --af '##000000'"
        "$MOD+ALT, R, exec, bemenu-run -i -p ' RUN' -M '5' --hp '5' --fn 'Cozette 8' --single-instance --ff '##000000' --fb '##FFFFFF' --tb '##FFFFFF' --tf '##000000' --cb '##FFFFFF' --cf '##000000' --hb '##000000' --hf '##FFFFFF' --ab '##FFFFFF' --nb '##FFFFFF' --nf '##000000' --af '##000000'"
        
        ", PRINT, exec, grim - | wl-copy"
        "$MOD, PRINT, exec, grim"
        
        "$MOD, M, exec, amixer set Capture toggle"
        "$MOD, M, exec, amixer set Mic toggle"
        
        "$MOD, B, exec, $TERM btop"
        "$MOD, T, exec, $TERM tmux"
        "$MOD, Y, exec, EDITOR=micro $TERM yazi"
        
        "$MOD+ALT, Q, killactive"
        "$MOD+ALT, SPACE, togglefloating"
        "$MOD+ALT, P, pin"
        "$MOD+ALT, F, fullscreen"
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
        "$MOD, GRAVE, togglespecialworkspace"
        "$MOD, 0, togglespecialworkspace"
        "$MOD, 1, workspace, 1"
        "$MOD, 2, workspace, 2"
        "$MOD, 3, workspace, 3"
        "$MOD, 4, workspace, 4"
        "$MOD, 5, workspace, 5"
        "$MOD, 6, workspace, 6"
        "$MOD, 7, workspace, 7"
        "$MOD, 8, workspace, 8"
        "$MOD, 9, workspace, 9"
        
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
        ", XF86MonBrightnessUp, exec, brillo -u 100000 -A 10"
        ", XF86MonBrightnessDown, exec, brillo -u 100000 -U 10"
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