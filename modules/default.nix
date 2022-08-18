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
    direnv
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
    discord
  ];


  programs.git.config = {
    init = {
      defaultBranch = "main";
    };

    user.name = "jdingbat";
    user.email = "jayrad.personal@protonmail.com";
  };

  # programs.git.signing = {
  #   key = "";
  #   signByDefault = true;
  # };

  # programs.git.extraConfig = {
  #   core.editor = "nvim";
  # };

  # programs.gpg.enable = true;
}
