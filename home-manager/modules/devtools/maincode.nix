{ config, lib, pkgs, ...}:

{ 
  
  options = {
    maincode.enable = lib.mkEnableOption "enables tpcode";
  };

  config = lib.mkIf config.maincode.enable {
    programs.vscode.profiles.default.userSettings = {
      "chat.editor.fontSize" = lib.mkForce 12.0;
      "editor.fontSize" = lib.mkForce 12.0;
      "workbench.colorTheme" = lib.mkForce "Dracula Theme";
    };
  };
}