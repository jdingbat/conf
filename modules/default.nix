{ config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages for all systems
  environment.systemPackages = with pkgs; [
    # editor
    neovim

    # rust utils
    fd
    xh
    bat
    exa
    fzf
    gcc
    glow
    cargo
    bottom
    zellij
    gnumake
    ripgrep

    # sys utils
    git
    zsh
    cargo
    
    # gui applications
    spotify
    alacritty
    bitwarden
  ];
}
