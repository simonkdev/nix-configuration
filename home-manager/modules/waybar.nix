{pkgs, lib, ...}:
{
programs.waybar = {
	enable = true;
	package = pkgs.waybar;
};

home.file."/home/simonkdev/.config/waybar/config" = {
  source = /home/simonkdev/nixsys/home-manager/modules/waybar/config;
};
home.file."/home/simonkdev/.config/waybar/style.css" = {
  source = lib.mkForce /home/simonkdev/nixsys/home-manager/modules/waybar/style.css;
}