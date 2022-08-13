{ config, pkgs, lib,  ... }:

{
  config = {

    xdg.configFile."nvim".recursive = true;
    xdg.configFile."nvim".source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "80c63b790c370fa65f5765d8e40a1544137c1c37";
      sha256="RkTzmgBMAgIRX4ZOQ0X4GqgR9fZjMjWlLUwrX6qIeZc=";
    };
    # xdg.configFile."nvim/lua/user".source = pkgs.fetchFromGitHub {
    #  owner = "jdingbat";
    #  repo = "astronvim_configs";
    #  rev = "306a3448cc23b7f36ca4b8dee8d99363d9cfeb2e";
    #  sha256 = "0nr9gpj5yz40zzx9a7dkri2j8mas723xrcwk4x49laqmh4y24maz";
    #};
  };
}
