
{
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
      "foreground" = "#FFFFFF";
      "background" = "#000000";
    };
  }
}