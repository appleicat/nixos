{ pkgs ? import <nixpkgs> {}, ... }:
{
  home.packages = with pkgs; [
   #cmatrix
   #neofetch
   #tty-clock
    swww
   #mpvpaper
   #bun
   #deno
   #nodejs
   #warp-terminal
   #hyper
   #discord
   #vesktop
   #cmus
   #ffmpeg-full
   #fim
   #timg
   #catimg
   #grim
   #slurp
   #wf-recorder
   #qemu
   #retroarchFull
    mc
    playerctl
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
 #programs.wezterm = {
 #  enable = true;
 #};
 #programs.foot = {
 #  enable = true;
 #};
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
 #programs.vscode = {
 #  enable = true;
 #};
 #services.mpd = { enable = true; };
  services.playerctld = { enable = true; };
 #programs.ncmpcpp = {
 #  enable = true;
 #};
 #programs.mpv = {
 #  enable = true;
 #};
  programs.bemenu = {
    enable = true;
  };
 #programs.chromium = {
 #  enable = true;
 #};
 #programs.firefox = {
 #  enable = true;
 #};
 #services.mako = {
 #  enable = true;
 #};
}