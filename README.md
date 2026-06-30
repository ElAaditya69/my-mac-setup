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


## 🎨 Themes & Aesthetics
- **Colors:** Deep cyberpunk slate background with vivid lavender accents (`#bd93f9`).
- **Borders:** Active window highlighting enabled natively via Yabai.

## 🚀 Quick Start
## ⚠️ Crucial: System Integrity Protection (SIP)
To use this layout configuration (especially for window borders and instant workspace focus hopping), Yabai requires its scripting additions to be injected. **You must partially disable SIP on your Mac.** 

> [!WARNING]
> Do not blindly turn off SIP completely! You can keep your Mac safe by only disabling the specific parts Yabai needs to manage windows.

### How to partially disable SIP for Yabai:
1. Shut down your Mac.
2. Hold the **Power Button** to boot into **Recovery Mode**.
3. Open **Terminal** from the top Utilities menu.
4. Run the following command to partially disable SIP securely:
   ```bash
   csrutil enable --without debug --without fs --without nvram
   ```
5. Restart your Mac normally.


To clone and browse these configuration files locally:
\`\`\`bash
git clone https://github.com
\`\`\`

### Copying Configs
- Yabai configuration goes to `~/.yabairc`
- SKHD configuration goes to `~/.skhdrc`
- Kitty configurations belong in `~/.config/kitty/`

