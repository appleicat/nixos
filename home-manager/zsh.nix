{
  programs.zsh = {
    enable = true;
    shellAliases = {
      H = "Hyprland";
      "cam+" = "sudo modprobe uvcvideo";
      "cam-" = "sudo rmmod -f uvcvideo";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" "themes" ];
    };
  };
}