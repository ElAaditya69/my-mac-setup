#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "🚀 Installing macOS Rice Setup..."
echo "📁 Repo: $REPO_DIR"

# Check macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is for macOS only!"
    exit 1
fi

# Check Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dependencies
echo "📦 Installing dependencies..."
brew install kitty yabai skhd btop fastfetch cava cmatrix switchaudio-osx starship jq
brew install --cask background-music

# Create config directories
mkdir -p ~/.config/{kitty,fastfetch,btop/themes,cava,sketchybar/plugins}

# Copy configs
echo "⚙️  Copying configurations..."
cp "$REPO_DIR/.yabairc" ~/.yabairc
cp "$REPO_DIR/.skhdrc" ~/.skhdrc
cp "$REPO_DIR/.zshrc" ~/.zshrc
cp "$REPO_DIR/.p10k.zsh" ~/.p10k.zsh 2>/dev/null || true

cp -r "$REPO_DIR/kitty/"* ~/.config/kitty/
cp -r "$REPO_DIR/fastfetch/"* ~/.config/fastfetch/
cp -r "$REPO_DIR/btop/"* ~/.config/btop/
cp -r "$REPO_DIR/cava/"* ~/.config/cava/
cp -r "$REPO_DIR/starship/"* ~/.config/ 2>/dev/null || true
cp -r "$REPO_DIR/sketchybar/"* ~/.config/sketchybar/

# Start services
echo "▶️  Starting services..."
yabai --start-service 2>/dev/null || true
skhd --start-service 2>/dev/null || true

# Fix audio
SwitchAudioSource -s "Background Music" 2>/dev/null || true

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Configure SIP (see README SIP section)"
echo "2. Run: kitty --session ~/.config/kitty/session.conf"
echo "3. Or use: ./scripts/launch-rice.sh"
