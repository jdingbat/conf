{ config, pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "jdingman";
  home.homeDirectory = "/Users/jdingman";

  users.users.jdingman = {
    home = "/Users/jdingman";
    shell = pkgs.zsh;
  };

  services.nix-daemon.enable = true;

  system.stateVersion = 4;

  home.sessionVariables = {};
}
