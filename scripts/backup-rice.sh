#!/bin/bash
REPO_DIR="$HOME/my-mac-setup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$REPO_DIR"/{kitty,fastfetch,btop/themes,cava,scripts,screenshots}

# Core configs
cp ~/.yabairc "$REPO_DIR/"
cp ~/.skhdrc "$REPO_DIR/"
cp ~/.config/kitty/kitty.conf "$REPO_DIR/kitty/"
cp ~/.config/kitty/kitty.conf.bak "$REPO_DIR/kitty/" 2>/dev/null
cp ~/.config/kitty/light-theme.auto.conf "$REPO_DIR/kitty/"
cp ~/.config/kitty/session.conf "$REPO_DIR/kitty/" 2>/dev/null
cp ~/.config/fastfetch/config.jsonc "$REPO_DIR/fastfetch/" 2>/dev/null
cp ~/.config/fastfetch/logo.txt "$REPO_DIR/fastfetch/" 2>/dev/null
cp ~/.config/btop/btop.conf "$REPO_DIR/btop/" 2>/dev/null
cp ~/.config/btop/themes/*.theme "$REPO_DIR/btop/themes/" 2>/dev/null
cp ~/.config/cava/config "$REPO_DIR/cava/" 2>/dev/null
cp ~/.zshrc "$REPO_DIR/"

# Scripts
cp ~/launch-rice.sh "$REPO_DIR/scripts/" 2>/dev/null
cp ~/restart-rice.sh "$REPO_DIR/scripts/" 2>/dev/null
cp ~/backup-rice.sh "$REPO_DIR/scripts/" 2>/dev/null
cp ~/fix-audio.sh "$REPO_DIR/scripts/" 2>/dev/null

# Screenshot
screencapture "$REPO_DIR/screenshots/desktop_$DATE.png"

cd "$REPO_DIR" && git add . && git commit -m "Working setup: $DATE" && git push origin main
echo "✅ Backup complete: $DATE"
