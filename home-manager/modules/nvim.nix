{ config, pkgs, ... }:

let
  nvchad = pkgs.stdenv.mkDerivation {
    name = "nvchad-config";
    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.5"; # or replace with latest commit hash
      sha256 = "<SHA256>";
    };

    installPhase = ''
      mkdir -p $out/config/nvim
      cp -r * $out/config/nvim
    '';
  };
in {
  programs.neovim.enable = true;

  xdg.configFile."nvim".source = "${nvchad}/config/nvim";

  home.packages = with pkgs; [
    git
    lazygit
    tree-sitter
    lua-language-server
  ];
}
