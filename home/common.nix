{ config, lib, pkgs, systemConfig, ...}:

{
  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.gh.enable = true;

  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    git
    zsh
  ];

  home.sessionPath = [ 
    "$HOME/.cargo/bin" 
    "$HOME/.local/bin" 
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    PRE_COMMIT_COLORS = "always";

    FZF_DEFAULT_OPTS = "--layout=reverse --inline-info --height 100% --border";
  };

  programs.zsh.enable = true;

    # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
