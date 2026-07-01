clear
# Using the -c flag centers it perfectly in the middle of your screen
figlet -c -f standard "Aaditya69"
echo ""
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
fastfetch
eval "$(starship init zsh)"




. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH=${PATH}:/usr/local/mysql-9.7.1-macos15-arm64/bin


alias ls="eza --icons"
alias ll="eza -la --icons"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 

# Ricing Auto-Backup Shortcut
alias backup-rice="cp ~/.yabairc ~/dotfiles/ && cp ~/.skhdrc ~/dotfiles/ && cp -r ~/.config/kitty ~/dotfiles/ && cd ~/dotfiles && git add . && git commit -m 'Auto-update config' && git push upstream main && cd -"

# Power-Saving Discord Launch Shortcut
alias discord="open -a Discord --args --disable-gpu --disable-gpu-rasterization"

# Rice Toggles



# Final Clean Rice Toggles


# Rice Toggles (clean)
alias riceoff="brew services stop sketchybar && yabai --stop-service && killall sketchybar 2>/dev/null; killall yabai 2>/dev/null"
alias riceon="yabai --start-service && brew services start sketchybar"
