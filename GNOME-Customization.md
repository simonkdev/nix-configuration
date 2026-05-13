# GNOME Customization

This repository includes comprehensive GNOME desktop environment customizations managed through Nix and stored in the `gnome` file.

## 🎨 Theme & Appearance

### Stylix Integration
- **Primary theme**: Stylix (applied via `stylix.nixosModules.stylix` and `stylix.homeModules.stylix`)
- **Icon theme**: Qogir
- **Cursor theme**: Bibata-Modern-Ice
- **GTK theme**: adw-gtk3

### Fonts
- **Default font**: DejaVu Sans 12
- **Document font**: DejaVu Serif 11
- **Monospace font**: DejaVu Sans Mono 12

## 🟪 Window Management

### Workspaces
- 4 workspaces configured
- Keyboard shortcuts:
  - Switch to workspace 1-4: `<Super>1` - `<Super>4`
  - Move window to workspace 1-4: `<Shift><Super>1` - `<Shift><Super>4`

### Window Controls
- Close window: `<Super>c`
- Toggle fullscreen: `<Super>f`
- Screenshot UI: `<Super>p`

## 📛 Desktop Settings

### Background
- Wallpaper: Custom image from `wallpapers/` directory
- Picture options: Zoom
- Color shading: Solid

### Interface
- Clock shows seconds
- Battery percentage displayed
- Hot corners disabled
- Cursor size: 16

### Input
- **Keyboard**: German (de) layout
- **Touchpad**: Two-finger scrolling enabled
- **Mouse**: Flat acceleration profile

## 🖠 Extensions

### Enabled Extensions
| Extension | Purpose |
|-----------|---------|
| user-theme | Custom theme support |
| blur-my-shell | Blur effects for shell |
| dash-to-dock | Customizable dock |
| lockscreen-extension | Enhanced lockscreen |
| search-light | Improved search |
| tiling-assistant | Window tiling helper |
| gtk4-ding | System tray |
| editdesktopfiles | Edit .desktop files |
| add-to-desktop | Add apps to desktop |
| azclock | Clock widget |
| advanced-weather | Weather information |

### Disabled Extensions
- dock-from-dash

## 📦 Custom Keybindings

### Application Launchers
| Shortcut | Application |
|----------|-------------|
| `<Super>q` | Kitty terminal |
| `<Super>s` | Discord |
| `<Super>x` | LibreFox browser |
| `<Super>e` | Thunar file manager |
| `<Super>a` | Yazi (terminal file manager) |

### System Controls
| Shortcut | Action |
|----------|--------|
| `<Super>space` | Application search |
| `<Super>y` | Screensaver |
| `F1-F4` | Volume control (mute, down, up) |
| `<Super>+`/`-` | Magnifier zoom |
| `<Alt>Tab` | Switch applications |
| `<Shift><Alt>Tab` | Switch applications backward |

## 📁 Application Folders

### Organized Categories
- **System**: System monitoring, disk utilities, logs
- **Utilities**: File manager, document viewer, archive tools
- **YaST**: System configuration (SUSE tools)

## 🌈 Visual Customizations

### Blur Effects
- **Blur-my-shell** extension provides blur effects
- Applied to:
  - Overview
  - Panel
  - Dash-to-dock
  - Window list
  - Screenshot UI
- Settings:
  - Sigma: 30
  - Brightness: 0.6-0.8
  - Static blur enabled

### OpenBar
- Custom bar configuration
- Background: Uses wallpaper image
- Color palettes for different UI elements

### AzClock Widget
- Weather widget in top-right corner
- Shows Munich weather
- Updates every 5 minutes
- Displays current temperature and forecast

## 📜 Configuration File

The GNOME settings are stored in the `gnome` file in the repository root, which contains dconf settings in INI format. This file can be applied using:
```sh
dconf load / < gnome
```
