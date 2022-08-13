{ config, pkgs, inputs, ... }:

{
  imports = [
  # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./modules
  ];

  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.utf8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  system.stateVersion = "22.05";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jacobsin = {
    isNormalUser = true;
    description = "jacobsin";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  home-manager.users.jacobsin = {pkgs, ...}: {
    imports = [ 
      ./home/linux.nix
      ./modules/alacritty
      ./modules/zellij
      ./modules/nvim
    ];
  };
}
