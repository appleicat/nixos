{ pkgs ? import <nixpkgs> {}, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
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
  ];
}