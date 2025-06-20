#! bin/bash

echo "Finishing Proton installation"
protonup

echo "setting up WinApps VM"
docker compose --file ~/nixsys/winapps/compose.yaml up


