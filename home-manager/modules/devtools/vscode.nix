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
    ];
    profiles.default.userSettings = {
      "chat.editor.fontFamily" = "DejaVu Sans Mono";
      "chat.editor.fontSize" = 12.0;
      "debug.console.fontFamily" = "DejaVu Sans Mono";
      "debug.console.fontSize" = 12.0;
      "editor.fontFamily" = "DejaVu Sans Mono";
      "editor.fontSize" = 12.0;
      "editor.inlayHints.fontFamily" = "DejaVu Sans Mono";
      "editor.inlineSuggest.fontFamily" = "DejaVu Sans Mono";
      "editor.minimap.sectionHeaderFontSize" = 7.714285714285714;
      "markdown.preview.fontFamily" = "DejaVu Sans";
      "markdown.preview.fontSize" = 12.0;
      "scm.inputFontFamily" = "DejaVu Sans Mono";
      "scm.inputFontSize" = 11.142857142857142;
      "screencastMode.fontSize" = 48.0;
      "terminal.integrated.fontSize" = 12.0;
      "workbench.colorTheme" = lib.mkForce "Dracula Theme";
    };
  };
}

