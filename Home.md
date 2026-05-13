# nix-configuration Wiki

**Personal NixOS and Home Manager configuration repository**

This repository contains my NixOS system configurations, Home Manager setups, and desktop environment customizations, all managed declaratively through Nix flakes.

## 📌 What This Repository Manages

| Category | Description |
|----------|-------------|
| **NixOS** | System-level configurations for multiple machines |
| **Home Manager** | User environment and application configurations |
| **GNOME** | Desktop environment settings, themes, and extensions |
| **Gaming** | Proton, WinApps, and Steam configurations |
| **Development** | Tooling, editors, and development environment setup |

## 🔍 Quick Navigation

- **[Setup Guide](Setup-Guide)** – Get started with cloning and applying configurations
- **[NixOS Configurations](NixOS-Configurations)** – System-level flake configurations
- **[Home Manager](Home-Manager)** – User environment and application management
- **[GNOME Customization](GNOME-Customization)** – Desktop themes, extensions, and settings
- **[Gaming Setup](Gaming-Setup)** – Proton, WinApps VM, and gaming tools
- **[Development Environment](Development-Environment)** – Editor settings and development tools

## 🏗️ Repository Structure

```
nix-configuration/
├── flake.nix          # Main flake definition
├── flake.lock         # Locked dependencies
├── nixos/             # NixOS configurations
│   ├── configs/       # Per-machine configurations
│   └── modules/       # Reusable NixOS modules
├── home-manager/      # Home Manager configurations
│   ├── home.nix       # Main home configuration
│   └── modules/       # Reusable Home Manager modules
├── gnome              # GNOME dconf settings
├── setup.sh           # Post-installation setup script
├── wallpapers/        # Desktop wallpapers
└── .vscode/           # VSCode settings
```

## 🔧 Technologies Used

- **NixOS** 25.11 (stable) with unstable channel for select packages
- **Home Manager** for user environment management
- **Stylix** for consistent theming across applications
- **Nix Flakes** for reproducible configurations
- **Docker** for WinApps VM
- **Proton** for Windows application compatibility
