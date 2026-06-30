# 🐲 macOS Sequoia Minimalist Rice

<p align="center">
  <img src="screenshots/desktop_clean.png" width="48%" />
  <img src="screenshots/desktop_full.png" width="48%" />
</p>

A highly optimized tiling window manager setup...

## ⚙️ System Specs & Software
- **OS:** macOS Sequoia 15
- **WM:** [Yabai](https://github.com) (Tiling Window Manager)
- **Hotkey Daemon:** [skhd](https://github.com)
- **Terminal:** Kitty
- **Status Bar:** SketchyBar
- **CLI Tools:** `btop` (System Monitor), `cava` (Audio Visualizer), `neo-matrix`

## 🎨 Themes & Aesthetics

## 🚀 Installation & Setup

Follow these steps precisely to get this exact look and functionality on your Mac.

### 1. Install Homebrew
If you don't have Homebrew installed yet, open your terminal and run:
```bash
/bin/bash -c "\$(curl -fsSL https://githubusercontent.com)"
```

### 2. Install the Core Software
Install the tiling window manager, hotkey daemon, and terminal emulator via Homebrew:
```bash
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install --cask kitty
```

### 3. Clone and Symlink Configurations
Clone this repository to your local machine and create symbolic links so your system reads the config files:
```bash
# Clone the repository
git clone https://github.com ~/dotfiles
cd ~/dotfiles

# Backup existing configs if they exist
mkdir -p ~/.config
mv ~/.config/kitty ~/.config/kitty.bak 2>/dev/null

# Create symlinks
ln -sf ~/dotfiles/.yabairc ~/.yabairc
ln -sf ~/dotfiles/.skhdrc ~/.skhdrc
ln -sf ~/dotfiles/kitty ~/.config/kitty
```

### 4. Start the Services
Run these commands to boot up Yabai and SKHD:
```bash
yabai --start-service
skhd --start-service
```
