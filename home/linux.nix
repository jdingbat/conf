{ config, lib, pkgs, systemConfig, ...}:

{
  imports = [
    ./common.nix
  ];

  home.username = "jacobsin";
  home.homeDirectory = "/home/jacobsin";

  home.sessionVariables = {
    ARCHFLAGS = "-arch x86_64-linux";
  };

  programs.firefox = {
    package = pkgs.firefox-wayland;
  };

  wayland.windowManager.sway = {
    enable = true;
    package = null;

    config = {
      modifier = "Mod4";

      gaps = {
        inner = 15;
        outer = 15;
      };

      terminal = "${pkgs.alacritty}/bin/alacritty";

      output = {
        "*".bg = "${config.home.homeDirectory}/conf/wallpapers/wallpaper.png fit";
        DP-1 = {
          pos = "2560 0";
        };
        DP-3 = {
          pos = "0 0";
        };
      };

    };
  };
}

