#!/bin/bash

# macOS dotfiles setup script
# Sets up symlinks and configurations for macOS

set -e

echo "🚀 Setting up dotfiles for macOS..."

# Backup existing configs
BACKUP_DATE=$(date +%Y%m%d_%H%M%S)

echo "📦 Backing up existing configs..."
[ -e ~/.config/kitty ] && [ ! -L ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.backup.$BACKUP_DATE
[ -e ~/.config/nvim ] && [ ! -L ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup.$BACKUP_DATE
[ -e ~/.zshrc ] && [ ! -L ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup.$BACKUP_DATE

echo "🔗 Creating symlinks..."
ln -sfn ~/dotfiles/kitty ~/.config/kitty
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "✅ Symlinks created:"
echo "  ~/.config/kitty -> ~/dotfiles/kitty"
echo "  ~/.config/nvim -> ~/dotfiles/nvim"
echo "  ~/.zshrc -> ~/dotfiles/zsh/.zshrc"

echo ""
echo "📝 Note: cos-switch is Linux-only and not needed on macOS"
echo "   Hammerspoon handles app switching on macOS (already configured)"
echo ""
echo "✨ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Restart kitty to apply new config (Alt+1-9 for tabs)"
echo "  2. Restart your terminal or run: source ~/.zshrc"
echo "  3. Open nvim - plugins will auto-install"
