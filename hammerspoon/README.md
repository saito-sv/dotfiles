# Hammerspoon Configuration (macOS only)

App launcher and window manager for macOS.

## Shortcuts

- **Ctrl+1** → Zen Browser
- **Ctrl+2** → Comet Browser
- **Ctrl+3** → kitty Terminal
- **Ctrl+4** → Slack

## Features

- Launches app if not running
- Focuses app if already running
- Maximizes and focuses window
- Uses low-level eventtap for Ctrl+1 & Ctrl+2 to override Mission Control

## Install

```bash
# Install Hammerspoon
brew install --cask hammerspoon

# Symlink config (done by setup_macos.sh)
ln -s ~/dotfiles/hammerspoon ~/.hammerspoon

# Reload config
# Click Hammerspoon menubar icon → Reload Config
```

## Note

This replaces `cos-switch` from the Linux setup. Same functionality, different tool.
