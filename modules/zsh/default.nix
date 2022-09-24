{config, pkgs, ...}: 

{
  programs.zsh.enable = true;
  programs.zsh.plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.7.0";
        sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.7.1";
        sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
      };
    }
  ];

  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.theme = "robbyrussell";
  programs.zsh.oh-my-zsh.plugins = [
    "fzf"
    "gpg-agent"
    "ssh-agent"
  ];

  programs.zsh.initExtra = ''
    eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
  '';

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.zsh.shellAliases = {
    c = "clear";
    ls = "exa -s size -l --group-directories-first --git --no-user";
    gs = "git status";
    cat = "bat";
    vim = "nvim";
    unpushed = "git log --branches --not --remotes --no-walk --decorate --oneline";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
