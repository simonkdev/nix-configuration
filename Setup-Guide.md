# Setup Guide

This guide walks you through setting up your system using this Nix configuration.

## 📃 Prerequisites

### System Requirements
- **NixOS** installed on your system
- **Git** for cloning the repository
- **Internet connection** for downloading dependencies

### Recommended
- Familiarity with Nix and NixOS concepts
- Basic understanding of flakes

## 🚀 Initial Setup

### 1. Clone the Repository
```sh
git clone https://github.com/simonkdev/nix-configuration ~/nixsys
cd ~/nixsys
```

### 2. Apply NixOS Configuration
Choose the appropriate configuration for your machine:

**For main machine:**
```sh
sudo nixos-rebuild switch --flake ~/nixsys/#main
```

**For ThinkPad:**
```sh
sudo nixos-rebuild switch --flake ~/nixsys/#thinkpad
```

### 3. Apply Home Manager Configuration
**For main machine:**
```sh
home-manager switch --flake ~/nixsys/#main
```

**For ThinkPad:**
```sh
home-manager switch --flake ~/nixsys/#thinkpad
```

## ⚙️ Post-Installation Setup

### Run the Setup Script
```sh
bash ~/nixsys/setup.sh
```

The setup script will:
- Finish **Proton** installation via `protonup`
- Set up the **WinApps VM** using Docker Compose
- Copy Docker configuration to `~/.config/winapps`
- Add WinApps to your PATH
- Launch the WinApps installer

### Manual Steps
After running `setup.sh`, you'll be prompted:
- **"Have you finished Windows in Browser? (y/n)"** – Complete Windows in Browser setup before confirming

## 🔄 Updating Configurations

### Pull Latest Changes
```sh
cd ~/nixsys
git pull
```

### Reapply Configurations
```sh
# NixOS
sudo nixos-rebuild switch --flake ~/nixsys/#<machine>

# Home Manager
home-manager switch --flake ~/nixsys/#<machine>
```

## 💡 Tips
- Replace `<machine>` with `main` or `thinkpad` based on your system
- The first rebuild may take significant time as it downloads all dependencies
- Check `flake.lock` for current dependency versions
