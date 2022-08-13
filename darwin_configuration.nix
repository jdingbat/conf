{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  environment.systemPackages = with pkgs; [ 
    home-manager
  ];

  home-manager.users.jdingman = {pkgs, ...}: {
    imports = [ 
      ./home/darwin.nix 
      ./modules/alacritty
    ];
  };

  users.users.jdingman = {
    home = "/Users/jdingman";
    shell = pkgs.zsh;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
