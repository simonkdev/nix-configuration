{ config, pkgs, ... }:
{
  programs.neovim.enable = true;

  programs.neovim.package = nvchad;

  home.packages = with pkgs; [
    git
    lazygit
    tree-sitter
    lua-language-server
  ];
}
