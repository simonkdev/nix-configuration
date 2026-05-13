# NixOS Configurations

This repository uses **NixOS flakes** to manage system configurations for multiple machines. The flake defines two NixOS configurations: `main` and `thinkpad`.

## 🗿 Flake Structure

The main `flake.nix` file defines:

### Inputs
| Input | Source | Purpose |
|-------|--------|---------|
| `nixpkgs` | `github:nixos/nixpkgs/nixos-25.11` | Stable NixOS packages |
| `unstable` | `github:NixOS/nixpkgs/nixos-unstable` | Unstable packages (with `allowUnfree = true`) |
| `home-manager` | `github:nix-community/home-manager/release-25.11` | Home Manager support |
| `stylix` | `github:nix-community/stylix/release-25.11` | Theming framework |

### Outputs
- **nixosConfigurations**: NixOS system configurations
  - `main` - Primary machine configuration
  - `thinkpad` - ThinkPad laptop configuration
- **homeConfigurations**: Home Manager configurations
  - `main` - User configuration for main machine
  - `thinkpad` - User configuration for ThinkPad

## 💻 Machine Configurations

### Main Machine
**Configuration files:**
- `nixos/configs/main-config.nix` - Main system configuration
- `nixos/configs/main-hardware.nix` - Hardware-specific settings

**Modules used:**
- `stylix.nixosModules.stylix` - Stylix theming
- `./nixos/configs/main-config.nix` - Custom configuration

**Apply configuration:**
```sh
sudo nixos-rebuild switch --flake ~/nixsys/#main
```

### ThinkPad
**Configuration files:**
- `nixos/configs/tp-config.nix` - ThinkPad system configuration
- `nixos/configs/tp-hardware.nix` - ThinkPad hardware settings

**Modules used:**
- `stylix.nixosModules.stylix` - Stylix theming
- `./nixos/configs/tp-config.nix` - Custom ThinkPad configuration

**Apply configuration:**
```sh
sudo nixos-rebuild switch --flake ~/nixsys/#thinkpad
```

## 🖠 NixOS Modules

The repository uses a modular approach with reusable NixOS modules:

### Boot Modules (`nixos/modules/boot/`)
- Bootloader configuration
- Kernel parameters
- Initial RAM disk settings

### Development Tools (`nixos/modules/devtools/`)
- Programming languages (Python, Node.js, Rust, etc.)
- Development utilities
- IDEs and editors

### Gaming (`nixos/modules/gaming/`)
- Steam
- Wine
- Proton
- Gaming peripherals support

### Miscellaneous (`nixos/modules/misc/`)
- System utilities
- Network configuration
- Security settings

## 📉 Configuration Inheritance

Both machine configurations inherit from:
- **Stylix**: Provides consistent theming across the system
- **Unstable packages**: Access to newer package versions via `unpkgs`
- **Allowed unfree packages**: Enables proprietary software when needed

## 🚀 Customizing for Your System

1. **Create a new configuration**:
   - Add a new entry in `flake.nix` under `nixosConfigurations`
   - Create corresponding config files in `nixos/configs/`

2. **Add hardware-specific settings**:
   - Create a new file in `nixos/configs/` (e.g., `my-machine-hardware.nix`)
   - Reference it in your configuration

3. **Enable modules**:
   - Add module paths to your configuration's `modules` list
