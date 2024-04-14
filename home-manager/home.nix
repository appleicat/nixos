{ username, stateVersion }:
{ pkgs ? import <nixpkgs> {}, ... }: 
{
  imports = [
    ( import ./fonts.nix )
    ( import ./apps.nix )
    ( import ./pointer.nix )
    ( import ./kitty.nix )
    ( import ./alacritty.nix )
    ( import ./zsh.nix )
    ( import ./cava.nix )
    ( import ./waybar.nix )
    ( import ./hyprland.nix )
    ( import ./settings.nix { inherit username stateVersion; } )
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