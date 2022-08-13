{ config, pkgs, lib,  ... }:

{
  config = {

    programs.alacritty.enable = true;
    xdg.configFile."alacritty/alacritty.yml".text = "${builtins.readFile ./alacritty.yml}";
  };
}
