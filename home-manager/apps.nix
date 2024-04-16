{ pkgs ? import <nixpkgs> {}, ... }:
{
  home.packages = with pkgs; [
   #hyper
    cmatrix
    neofetch
    tty-clock
    swww
    cmus
    ffmpeg
    fim
    timg
    catimg
    grim
    slurp
    wf-recorder
    mc
    playerctl
    helvum
  ];
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
  programs.ranger = {
    enable = true;
  };
  programs.lf = {
    enable = true;
  };
  programs.yazi = {
    enable = true;
  };
  programs.xplr = {
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
  services.mpd = {
    enable = true;
    musicDirectory = "~/.music";
  };
  services.playerctld = {
    enable = true;
  };
  programs.ncmpcpp = {
    enable = true;
  };
  programs.bemenu = {
    enable = true;
  };
  services.mako = {
    enable = true;
  };
  services.easyeffects = {
    enable = true;
  };
 #programs.wezterm = {
 #  enable = true;
 #};
}