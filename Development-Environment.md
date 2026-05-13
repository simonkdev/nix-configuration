# Development Environment

This repository includes configurations for development tools, editors, and programming environments.

## 💻 Editors & IDEs

### VSCode
- **Configuration**: `.vscode/settings.json`
- **Settings** include:
  - Theme and appearance
  - Editor behavior
  - File associations
  - Extensions recommendations

### Kitty Terminal
- **Launcher**: `<Super>q` (via GNOME keybinding)
- **Configuration**: Managed through Home Manager
- **Features**: GPU-accelerated, ligatures support

### Yazi
- **Launcher**: `<Super>a` (opens in Kitty)
- **Description**: Terminal file manager
- **Command**: `kitty -e bash -c "yazi"`

## 🚀 Development Tools

### DevTools Modules
The repository includes development tool configurations in:

**NixOS Modules (`nixos/modules/devtools/`)**
- System-level development packages
- Compilers and build tools
- Debugging utilities

**Home Manager Modules (`home-manager/modules/devtools/`)**
- User-level development tools
- CLI utilities
- Version control systems

### Available Tools
| Category | Tools |
|----------|-------|
| **Version Control** | Git, GitHub CLI |
| **Languages** | Python, Node.js, Rust, Go, etc. |
| **Build Systems** | CMake, Make, Ninja |
| **Containerization** | Docker, Podman |
| **Package Managers** | npm, pip, cargo |
| **Testing** | Various testing frameworks |
| **Linters/Formatters** | ESLint, Prettier, Black, etc. |

## 📁 Project Management

### File Managers
- **Thunar**: `<Super>e` (GUI file manager)
- **Yazi**: `<Super>a` (Terminal file manager)
- **nnn**: Available via Home Manager

### Bulk Rename
- **thunar-bulk-rename**: Available in application menu

## 🌈 Theming for Development

### Consistent Themes
- **Stylix** provides consistent theming across all development tools
- Terminal colors match GTK theme
- Editor themes synchronized with system theme

### Color Schemes
- Dark theme by default
- Custom color palettes defined in Stylix configuration
- Syntax highlighting themes coordinated

## 📦 Nix Development

### Flake Management
- **Flake inputs**: Defined in `flake.nix`
  - `nixpkgs`: Stable channel
  - `unstable`: Unstable channel with `allowUnfree = true`
  - `home-manager`: Home Manager support
  - `stylix`: Theming framework

### Project-Specific Dependencies
- Managed using **[Devenv](https://devenv.sh/)** for reproducible development environments
- Each project can have its own `devenv.yaml` and `devenv.nix`
- Provides shells with all necessary dependencies
- Supports multiple languages and tools per project

### Devenv Commands
```sh
# Enter development shell
devenv shell

# Run specific tasks
devenv tasks run <task-name>

# List available tasks
devenv tasks list
```

## 🚀 Customizing Development Environment

### Add a New Language
1. Create a new module in `nixos/modules/devtools/` or `home-manager/modules/devtools/`
2. Add the language runtime and tools
3. Include in your configuration

### Add Editor Configuration
1. Create editor-specific configuration file
2. Add to appropriate Home Manager module
3. Reapply configuration

### Add Project-Specific Tools
1. Create a `devenv.yaml` and `devenv.nix` for your project
2. Define dependencies and tools
3. Use `devenv shell` to enter the environment
