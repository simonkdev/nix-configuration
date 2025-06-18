Installation:

cloning the flake into ~/nixsys and 

	cd ~/nixsys


rebuild with:

	nixos-rebuild switch --flake ~/nixsys/#main
	home-manager switch --flake ~/nixsys/#main

executing 

	bash setup.sh

This will: 

- configure a docker VM for winapps
- execute the only necessary imperative command for ProtonGE installation

