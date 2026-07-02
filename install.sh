#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

print_header() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "$1"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

backup_file() {
    if [[ -f "$1" ]]; then
        cp "$1" "$1.backup.$(date +%Y%m%d-%H%M%S)"
        echo "💾 Backed up $(basename "$1")"
    fi
}

print_header "🐉 macOS Rice Installer"

echo "📁 Repository: $REPO_DIR"

# Check macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This installer only supports macOS."
    exit 1
fi

# Detect architecture
ARCH=$(uname -m)

if [[ "$ARCH" == "arm64" ]]; then
    echo "🍎 Apple Silicon detected"
else
    echo "💻 Intel Mac detected"
fi

# Check Homebrew
if ! command -v brew >/dev/null 2>&1; then
    print_header "🍺 Installing Homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

print_header "📦 Installing Dependencies"

brew install \
kitty \
yabai \
skhd \
btop \
fastfetch \
cava \
cmatrix \
switchaudio-osx \
starship \
jq

brew install --cask background-music

print_header "💾 Backing Up Existing Configuration"

backup_file ~/.zshrc
backup_file ~/.yabairc
backup_file ~/.skhdrc

print_header "⚙️ Copying Configuration Files"

mkdir -p \
~/.config/kitty \
~/.config/fastfetch \
~/.config/btop/themes \
~/.config/cava \
~/.config/sketchybar/plugins

cp "$REPO_DIR/.yabairc" ~/.yabairc
cp "$REPO_DIR/.skhdrc" ~/.skhdrc
cp "$REPO_DIR/.zshrc" ~/.zshrc

cp -R "$REPO_DIR/kitty/"* ~/.config/kitty/
cp -R "$REPO_DIR/fastfetch/"* ~/.config/fastfetch/
cp -R "$REPO_DIR/btop/"* ~/.config/btop/
cp -R "$REPO_DIR/cava/"* ~/.config/cava/
cp -R "$REPO_DIR/starship/"* ~/.config/ 2>/dev/null || true
cp -R "$REPO_DIR/sketchybar/"* ~/.config/sketchybar/

print_header "🚀 Starting Services"

yabai --start-service 2>/dev/null || true
skhd --start-service 2>/dev/null || true

SwitchAudioSource -s "Background Music" 2>/dev/null || true

print_header "🎉 Installation Complete"

echo "Your macOS Rice has been installed successfully."

echo ""
echo "Next Steps:"
echo "  1. Review the SIP section in the README (if using advanced yabai features)."
echo "  2. Restart your terminal."
echo "  3. Launch your workspace:"
echo ""
echo "     kitty --session ~/.config/kitty/session.conf"
echo ""
echo "Happy Ricing! 🍎🐉"