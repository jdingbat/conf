{ config, pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "jdingman";
  home.homeDirectory = "/Users/jdingman";

  home.sessionVariables = {};
}
