{ config, pkgs, lib,  ... }:

{
  config = {

    programs.zellij.enable = true;
    xdg.configFile."zellij/layouts/default.yml".text = "${builtins.readFile ./default.yml}";
  };
}
