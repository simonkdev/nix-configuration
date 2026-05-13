# Gaming Setup

This repository includes configurations for gaming on NixOS, including Proton, Wine, and WinApps support.

## 🎮 Core Components

### Proton
- **Proton** is a compatibility layer for running Windows games on Linux
- Installed via `protonup` (called by `setup.sh`)
- Provides Steam Play compatibility

### Wine
- **Wine** is configured for running Windows applications
- Available through Nixpkgs
- Used as a dependency for Proton and WinApps

## 🐳 WinApps VM

### Overview
WinApps is a solution for running Windows applications on Linux using a Docker container with Wine.

### Setup Process
1. **Docker Compose**: The WinApps VM is managed via Docker Compose
2. **Configuration file**: `winapps/compose.yaml` (created at runtime)
3. **Configuration**: `winapps/winapps.conf` (copied to `~/.config/winapps`)

### Running the Setup
The `setup.sh` script automates the WinApps setup:
```sh
bash ~/nixsys/setup.sh
```

This script:
1. Runs `protonup` to install/update Proton
2. Starts the WinApps Docker container using `docker compose`
3. Copies the WinApps configuration to your home directory
4. Adds WinApps to your PATH
5. Launches the WinApps installer

### Manual Setup
If you prefer to set up manually:
```sh
# Start the VM
docker compose --file ~/nixsys/winapps/compose.yaml up -d

# Copy configuration
cp ~/nixsys/winapps/winapps.conf ~/.config/winapps

# Add to PATH
echo 'export PATH=/home/simonkdev/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Run installer
winapps-setup
```

## 🎖 Gaming Applications

### Steam
- Installed via Nixpkgs
- Configured with Proton support
- Available in both NixOS configurations

### Proton-GE
- Custom version of Proton with additional patches
- Installed via `protonup` during setup
- Provides better compatibility with many games

### Lutris
- Game manager and launcher
- Supports multiple runners (Wine, Proton, etc.)
- Configured in the gaming module

## 🎔 Controller Support

### Configuration
- Game controller support enabled
- Input device configurations managed through NixOS modules
- Compatible with various controllers (XInput, DInput)

### Gaming Module
The `nixos/modules/gaming/` directory contains:
- Steam configuration
- Wine setup
- Controller support
- Gaming utilities

## 🚀 Troubleshooting

### Common Issues
| Issue | Solution |
|-------|----------|
| Proton not found | Run `protonup` manually |
| WinApps not in PATH | Source `~/.bashrc` or restart terminal |
| Docker container not running | Check with `docker ps` and `docker compose up` |
| Game won't launch | Check Proton version and game compatibility |

### Useful Commands
```sh
# Check Proton version
protonup --version

# List running Docker containers
docker ps

# View WinApps logs
journalctl -u docker -f

# Restart WinApps container
docker compose --file ~/nixsys/winapps/compose.yaml restart
```

## 📖 Resources
- [ProtonDB](https://www.protondb.com/) - Game compatibility database
- [WinApps Documentation](https://github.com/Fmstrat/winapps) - Official WinApps docs
- [ProtonUp-Qt](https://github.com/DavidoTek/ProtonUp-Qt) - GUI for managing Proton versions
