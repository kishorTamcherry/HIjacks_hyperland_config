# 🌟 Enhanced Hyprland Dots - Built on JaKooLit's Base

A beautiful and highly customized Hyprland configuration with enhanced breathing borders, dynamic theming, and smooth animations. This is an enhanced version built on top of [JaKooLit's Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland) base.

## 🚀 Installation

### Prerequisites
This configuration is built on top of [JaKooLit's Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland). You must install the base system first.

### Step 1: Install JaKooLit's Arch-Hyprland Base

```bash
# Auto-install (recommended)
sh <(curl -L https://raw.githubusercontent.com/JaKooLit/Arch-Hyprland/main/auto-install.sh)

# OR Manual install
git clone --depth=1 https://github.com/JaKooLit/Arch-Hyprland.git ~/Arch-Hyprland
cd ~/Arch-Hyprland
chmod +x install.sh
./install.sh
```

### Step 2: Apply Enhanced Configuration

After installing the base system, apply this enhanced configuration:

```bash
# Clone this enhanced configuration
git clone https://github.com/kishorTamcherry/HIjacks_hyperland_config.git ~/enhanced-hyprland

# Backup original config (optional but recommended)
cp -r ~/.config/hypr ~/.config/hypr.backup

# Apply enhanced configuration
cp -r ~/enhanced-hyprland/* ~/.config/hypr/

# Make scripts executable
chmod +x ~/.config/hypr/UserScripts/*.sh
chmod +x ~/.config/hypr/scripts/*.sh

# Restart Hyprland or reboot
```

## ✨ Enhanced Features

### 🎨 **Enhanced Breathing Borders**
- **RainbowBorders.sh**: Advanced breathing effect with wallpaper color matching
- **Multiple Breathing Patterns**: Smooth, pulsing, wave, gradient, rainbow, heartbeat, and strobe effects
- **Dynamic Color Transitions**: Smooth interpolation between colors
- **Wallpaper Integration**: Automatically matches your wallpaper colors via Wallust

### 🖥️ **Desktop Environment**
- **Hyprland**: Modern Wayland compositor with smooth animations
- **Waybar**: Customizable status bar with multiple styles
- **Rofi**: Application launcher with themes
- **SWWW**: Wallpaper management with effects
- **Wallust**: Dynamic theming based on wallpaper colors

### 🎭 **Visual Effects**
- **Blur Effects**: Configurable blur with multiple passes
- **Animations**: Smooth window animations and transitions
- **Rounded Corners**: Beautiful rounded window corners
- **Shadows**: Dynamic shadow effects
- **Transparency**: Configurable opacity settings

### 🎮 **Gaming & Performance**
- **Game Mode**: Optimized settings for gaming
- **Monitor Profiles**: Multiple monitor configurations
- **Performance Scripts**: Various optimization utilities

## 📁 Structure

```
hyprland-dots/
├── UserConfigs/           # User customizations
│   ├── UserSettings.conf      # Main Hyprland settings
│   ├── UserKeybinds.conf      # Custom keybindings
│   ├── UserDecorations.conf   # Window decorations
│   ├── UserAnimations.conf    # Animation settings
│   ├── WindowRules.conf       # Window management rules
│   ├── Startup_Apps.conf      # Applications to start on boot
│   └── ENVariables.conf       # Environment variables
├── UserScripts/           # Custom scripts
│   ├── RainbowBorders.sh      # Enhanced breathing borders
│   └── ...                   # Other custom scripts
├── scripts/               # Utility scripts
│   ├── DarkLight.sh          # Theme switching
│   ├── Brightness.sh         # Brightness control
│   ├── Volume.sh             # Volume control
│   ├── ScreenShot.sh         # Screenshot utilities
│   └── ...                   # Many more utilities
├── configs/               # Default configurations
├── animations/            # Animation presets
├── Monitor_Profiles/      # Monitor configurations
├── wallust/              # Wallust theming
├── wallpaper_effects/     # Wallpaper management
└── hyprland.conf         # Main configuration file
```

## 🎨 Customization

### Breathing Borders
The enhanced `RainbowBorders.sh` script provides multiple breathing patterns:

- **Smooth Breathing**: Classic breathing effect
- **Pulsing Effect**: Color transitions with complementary colors
- **Wave Effect**: Multiple color variations
- **Gradient Breathing**: Smooth color stops
- **Rainbow Cycle**: Full spectrum breathing
- **Heartbeat Effect**: Realistic double-beat pattern
- **Strobe Effect**: Rapid flashing

### Themes
- **Dark/Light Mode**: Easy theme switching
- **Wallpaper Integration**: Automatic color scheme generation
- **GTK/Kvantum**: Full theme integration

## 🔧 Configuration

### Key Features
- **Modular Design**: Clean separation of concerns
- **Easy Customization**: User-friendly configuration files
- **Performance Optimized**: Gaming and productivity focused
- **Cross-Platform**: Works on various Linux distributions

### Scripts
- **30+ Utility Scripts**: Brightness, volume, screenshots, etc.
- **Custom Scripts**: User-defined functionality
- **Automation**: Startup and background processes

## 🎮 Keybinds

### Essential Keybinds
- **SUPER + ENTER**: Open terminal
- **SUPER + Q**: Close window
- **SUPER + SHIFT + Q**: Kill window
- **SUPER + D**: Open application launcher (Rofi)
- **SUPER + SHIFT + K**: Search keybinds
- **SUPER + H**: Show keybind hints

### Breathing Borders Control
- **SUPER + SHIFT + B**: Toggle breathing borders
- **SUPER + SHIFT + P**: Toggle wallpaper color borders

For complete keybind list, press **SUPER + H** or **SUPER + SHIFT + K**.

## 📸 Screenshots

*Add your screenshots here to showcase the beautiful effects*

## 🔄 Updates

### Updating Base System
```bash
# Update JaKooLit's base system
cd ~/Arch-Hyprland
git pull
./install.sh
```

### Updating Enhanced Config
```bash
# Update enhanced configuration
cd ~/enhanced-hyprland
git pull
cp -r * ~/.config/hypr/
```

## 🤝 Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Submitting pull requests
- Improving documentation

## 📄 License

## 👨‍💻 Author

**Kishor Th** - [@kichukic](https://github.com/kichukic)

Security analyst and offensive grey hat with expertise in node.js, go.js, neo4j, js, linux and more under the hood.


This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- **[JaKooLit](https://github.com/JaKooLit/Arch-Hyprland)**: Original Arch-Hyprland installer and base configuration
- **Hyprland Community**: Amazing Wayland compositor
- **Open Source Community**: All the tools and utilities

## 🆘 Troubleshooting

### Common Issues

1. **Breathing borders not visible**: Make sure the script is executable and running
2. **Wallpaper not changing**: Check SWWW installation and configuration
3. **Themes not applying**: Verify Wallust installation and configuration

### Getting Help
- Check the [JaKooLit Wiki](https://github.com/JaKooLit/Arch-Hyprland/wiki)
- Open an issue on this repository
- Join the [JaKooLit Discord](https://discord.gg/jakoolit)

---

**Enjoy your beautiful, breathing Hyprland setup! 🌟**

*Built with ❤️ by [Kishor Th](https://github.com/kichukic) on top of [JaKooLit's Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland)* 