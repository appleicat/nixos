{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, disko, ... }:
  let
    system = "x86_64-linux";
    hostname = "nixos";
    username = "kitty";
    stateVersion = "24.05";
  in
  {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          home-manager.nixosModules.home-manager
          disko.nixosModules.disko
          ( import ./system/configuration.nix { inherit hostname username stateVersion; } )
          ( import ./system/hardware-configuration.nix )
          ( import ./home-manager/home-manager.nix { inherit username stateVersion; } )
        ];
      };
    };
  };
}
