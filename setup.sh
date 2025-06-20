#! bin/bash

echo "Finishing Proton installation"
protonup

echo "setting up WinApps VM"
docker compose --file ~/nixsys/winapps/compose.yaml up

echo "Copying Docker config"
cp ~/nixsys/winapps/winapps.conf ~/.config/winapps"

while true; do
    read -p "Have you finished Windows in Browser? (y/n): " answer
    case "$answer" in
        [Yy]) echo "Continuing..."; break ;;
        [Nn]) echo "Aborted."; exit 1 ;;
        *) echo "Please answer y or n." ;;
    esac
done

echo "Preparing winapps path"
echo 'export PATH=/home/simonkdev/.local/bin:$PATH' >> ~/.bashrc && source ~/.bashrc

echo "Starting WinApps installer for you"
winapps-setup


