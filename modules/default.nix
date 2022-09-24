{ config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages for all systems
  environment.systemPackages = with pkgs; [
    # editor
    neovim

    # utils
    fd
    gh
    xh
    bat
    exa
    fzf
    gcc
    zsh
    glow
    cargo
    cmake
    bottom
    zellij
    gnumake
    ripgrep
    
    direnv

    # sys utils
    git
    zsh
    cargo
  ];
}
