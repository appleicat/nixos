{
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
}