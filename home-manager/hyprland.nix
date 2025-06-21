{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
###############################
######## MAIN PROGRAMS ########
###############################

"$term" = "kitty";
"$fileManager" = "dolphin";
"$launcher" = "wofi --show drun";

"exec-once" = [
"waybar"
];



#######################
######## INPUT ########
#######################
 
input = {
  "kb_layout" = "de";
}; ## endinput
 
gestures = { 
  "workspace_swipe" = false;
}; ## endgestures



#############################
####### LOOK AND FEEL #######
#############################

monitor = [

"HDMI-A-2, preferred, 1920x0@75, 1.0"
"eDP-1, preferred, 0x0@75, 1"
# "eDP-1, disable"
];

bezier = [

"easeOutQuint, 0.23,1,0.32,1"
"easeInOutCubic, 0.65,0.05,0.36,1"
"linear,0,0,1,1"
"almostLinear,0.5,0.5,0.75,1.0"
"quick,0.15,0,0.1,1"

];

cursor = {

"inactive_timeout" = 20;

};

animation = [

"global, 1, 10, default"
"border, 1, 5.39, easeOutQuint"
"windows, 1, 4.79, easeOutQuint"
"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
"windowsOut, 1, 1.49, easeOutQuint, popin 87%"
"fadeIn, 1, 1.73, almostLinear"
"fadeOut, 1, 1.46, almostLinear"
"fade, 1, 3.03, quick"
"layers, 1, 4, easeOutQuint"
"layersIn, 1, 1.5, linear, fade"
"layersOut, 1, 1.5, linear, fade"
"fadeLayersIn, 1, 1.79, almostLinear"
"fadeLayersOut, 1, 1.39, almostLinear"
"workspaces, 1, 1.94, almostLinear, fade"
"workspacesIn, 1, 1.21, almostLinear, fade"
"workspacesOut, 1, 1.94, almostLinear, fade"

];


dwindle = {
  
  pseudotile = true;
  "preserve_split" = true;

};

general = {

"border_size" = 0;
"gaps_in" = 3;
"gaps_out" = 8;
"allow_tearing" = false;

};

decoration = {

rounding = 6;
"rounding_power" = "3.0";
"active_opacity" = "0.85";
"inactive_opacity" = "0.7";
"fullscreen_opacity" = "1.0";

blur = {

enabled = true;
size = 3;
passes = 5;
"ignore_opacity" = true;
brightness = "2.0";
vibrancy = "0.5";

}; ## blurend
}; ## decorationend








###########################
####### KEYBINDINGS #######
###########################

"$mod" = "SUPER"; # Windows key is "mod"


bind = [


#### Simple binds

"$mod, Q, exec, $term"
"$mod, C, killactive"
"$mod, M, exit"
"$mod, E, exec, $fileManager"
"$mod, V, togglefloating"
"$mod, R, exec, $launcher"
"$mod, F, fullscreen"
", Print, exec, hyprshot -m output -m HDMI-A-2 -o ~/screenshots"

#### Move windows with arrow keys

"$mod SHIFT, left, swapwindow, l"
"$mod SHIFT, right, swapwindow, r"
"$mod SHIFT, up, swapwindow, u"
"$mod SHIFT, down, swapwindow, d"

#### Moving focus with arrows

"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u"
"$mod, down, movefocus, d"

#### Switching workspaces

"$mod, 1, workspace, 1"
"$mod, 2, workspace, 2"
"$mod, 3, workspace, 3"
"$mod, 4, workspace, 4"
"$mod, 5, workspace, 5"
"$mod, 6, workspace, 6"
"$mod, 7, workspace, 7"
"$mod, 8, workspace, 8"
"$mod, 9, workspace, 9"
"$mod, 0, workspace, 10"

#### Move window to workspace

"$mod SHIFT, 1, movetoworkspace, 1"
"$mod SHIFT, 2, movetoworkspace, 2"
"$mod SHIFT, 3, movetoworkspace, 3"
"$mod SHIFT, 4, movetoworkspace, 4"
"$mod SHIFT, 5, movetoworkspace, 5"
"$mod SHIFT, 6, movetoworkspace, 6"
"$mod SHIFT, 7, movetoworkspace, 7"
"$mod SHIFT, 8, movetoworkspace, 8"
"$mod SHIFT, 9, movetoworkspace, 9"
"$mod SHIFT, 0, movetoworkspace, 0"

#### Scroll through workspaces with win+scroll

"$mod, mouse_down, workspace, e+1"
"$mod, mouse_up, workspace, e-1"

]; ## endbinds

bindm = [

#### Move/Resize Windows with win+mousebuttons

"$mod, mouse:272, movewindow"
"$mod, mouse:273, resizewindow"

]; ## endbindms

bindel = [

#### Multimediakeys TO DO

];

#########################
##### WINDOW RULES ######
#########################

windowrule = [
"opacity [2.0 2.0], class:kitty"
"rounding [12], class:wofi"
"roundingpower [10.0], class:wofi"
"float, class:pavucontrol"
];
layerrule = [
"noanim, wofi"
];

env = [
"LIBVA_DRIVER_NAME,nvidia"
"__GLX_VENDOR_LIBRARY_NAME,nvidia"
"__NV_PRIME_RENDER_OFFLOAD,1"
"WLR_NO_HARDWARE_CURSORS,0"
];


  }; ## endsettings
 }; ## endhyprland

########################




}
