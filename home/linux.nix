{ config, lib, pkgs, systemConfig, ...}:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    waybar
  ];

  home.username = "jacobsin";
  home.homeDirectory = "/home/jacobsin";

  home.sessionVariables = {
    ARCHFLAGS = "-arch x86_64-linux";
  };

  # programs.firefox = {
  #   package = pkgs.firefox-wayland;
  # };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # xdg.configFile."waybar".recursive = true;
  xdg.configFile."waybar".source = ../modules/waybar;

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = {
      modifier = "Mod4";

      bars = [];

      gaps = {
        inner = 10;
        outer = 10;
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

      startup = [
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
              timeout 300 "swaylock -f" \
              timeout 600 'swaymsg "output * dpms off"' \
                resume 'swaymsg "output * dpms on"' \
              before-sleep "swaylock -f"
          '';
        }
      ];

    };
  };
}

