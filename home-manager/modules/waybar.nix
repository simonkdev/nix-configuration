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
};
home.file."/home/simonkdev/.config/waybar/machiatto.css" = {
  source = /home/simonkdev/nixsys/home-manager/modules/waybar/machiatto.css;
};
home.file."/home/simonkdev/.config/waybar/style-background.css" = {
  source = /home/simonkdev/nixsys/home-manager/modules/waybar/style-background.css;
};
}