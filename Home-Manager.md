# Home Manager

Home Manager is used to manage user-specific configurations, applications, and environment settings declaratively.

## 🗿 Structure

The Home Manager configurations are defined in the `home-manager/` directory:

```
home-manager/
├── home.nix          # Main home configuration (for main machine)
├── tp-home.nix       # ThinkPad home configuration
└── modules/          # Reusable Home Manager modules
    ├── apps/
    ├── desktops/
    ├── devtools/
    ├── fastfetch/
    ├── hyprlock.nix
    ├── readmode/
    ├── stylix/
    ├── waybar/
    └── wofi/
```

## 📃 Configurations

### Main Machine
**File**: `home-manager/home.nix`

**Apply configuration:**
```sh
home-manager switch --flake ~/nixsys/#main
```

### ThinkPad
**File**: `home-manager/tp-home.nix`

**Apply configuration:**
```sh
home-manager switch --flake ~/nixsys/#thinkpad
```

## 🖠 Home Manager Modules

### Applications (`home-manager/modules/apps/`)
- Productivity applications
- Media players
- Utilities

### Desktop Environments (`home-manager/modules/desktops/`)
- Desktop-specific configurations
- Window manager settings

### Development Tools (`home-manager/modules/devtools/`)
- Code editors and IDEs
- Version control tools
- Build systems

### FastFetch (`home-manager/modules/fastfetch/`)
- System information display
- Custom themes and configurations

### Hyprlock (`home-manager/modules/hyprlock.nix`)
- Screen locker configuration
- Theming and behavior

### ReadMode (`home-manager/modules/readmode/`)
- Readability enhancements
- Focus mode configurations

### Stylix (`home-manager/modules/stylix/`)
- **Stylix** theming for Home Manager
- Consistent look and feel across applications
- Color schemes and styling

### Waybar (`home-manager/modules/waybar/`)
- Status bar configuration
- Modules and appearance

### Wofi (`home-manager/modules/wofi/`)
- Application launcher
- Window switcher
- Theming

## 💍 Theming

The repository uses **Stylix** for consistent theming across both NixOS and Home Manager:

- **Stylix NixOS Module**: Applied to all NixOS configurations via `stylix.nixosModules.stylix`
- **Stylix Home Module**: Applied to all Home Manager configurations via `stylix.homeModules.stylix`
- **Custom Stylix Config**: `home-manager/modules/stylix/` contains additional customizations

This ensures a cohesive visual experience across the entire system.

## 📦 Package Management

Home Manager handles user-level packages, including:
- CLI tools
- GUI applications
- Development environments
- Fonts and themes

## 🚀 Customizing

1. **Add a new application**:
   - Create a new module in `home-manager/modules/apps/`
   - Add it to your `home.nix` or `tp-home.nix` configuration

2. **Change theme**:
   - Modify Stylix settings in the appropriate module
   - Reapply Home Manager configuration

3. **Add development tools**:
   - Add to `home-manager/modules/devtools/`
   - Reference in your home configuration
