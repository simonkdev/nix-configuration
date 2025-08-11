{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./vscode.nix
  ];

  options = {
    tpcode.enable = lib.mkEnableOption "enables tpcode";
  };

  config = lib.mkIf config.tpcode.enable {
    programs.vscode.profiles.default.userSettings = {
      "chat.editor.fontSize" = lib.mkForce 16.0;
      "editor.fontSize" = lib.mkForce 16.0;
      "workbench.colorTheme" = lib.mkForce "Cattpuccin Macchiato";
    };
  };
}
