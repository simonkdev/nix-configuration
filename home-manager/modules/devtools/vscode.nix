{
  lib,
  config,
  pkgs,
  unpkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      esbenp.prettier-vscode
      vscjava.vscode-java-pack
      github.copilot-chat
      github.copilot
      ms-python.python
      ms-python.vscode-pylance
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      jdinhlife.gruvbox
      adpyke.codesnap
      dracula-theme.theme-dracula
      kamadorueda.alejandra
      nur.just-black
    ];
    profiles.default.userSettings = {
      "chat.editor.fontFamily" = "DejaVu Sans Mono";
      "debug.console.fontFamily" = "DejaVu Sans Mono";
      "editor.fontFamily" = "DejaVu Sans Mono";
      "editor.inlayHints.fontFamily" = "DejaVu Sans Mono";
      "editor.inlineSuggest.fontFamily" = "DejaVu Sans Mono";
      "markdown.preview.fontFamily" = "DejaVu Sans";
      "scm.inputFontFamily" = "DejaVu Sans Mono";
      "chat.editor.fontSize" = lib.mkForce 12.0;
      "editor.fontSize" = lib.mkForce 12.0;
      "workbench.colorTheme" = lib.mkForce "Dark Modern";
    };
  };
}
