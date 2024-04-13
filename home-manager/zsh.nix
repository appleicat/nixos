{
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
}