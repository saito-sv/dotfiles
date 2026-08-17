# macOS Dotfiles Setup

This is your dotfiles repository adapted for macOS. The setup mirrors your Linux configuration with macOS-specific adjustments.

## Quick Setup

```bash
# Clone dotfiles (already done)
git clone git@github.com:saito-sv/dotfiles.git ~/dotfiles

# Run setup script
~/dotfiles/setup_macos.sh
```

## What's Configured

### ✅ Symlinks Created
- `~/.config/kitty` → `~/dotfiles/kitty`
- `~/.config/nvim` → `~/dotfiles/nvim`
- `~/.zshrc` → `~/dotfiles/zsh/.zshrc`

### ✅ Kitty Terminal
**Alt+1-9** for tab switching (same as Linux!)
- `Alt+1` → Tab 1
- `Alt+2` → Tab 2
- ... through Alt+9

**Other shortcuts:**
- `Ctrl+Shift+T` → New tab
- `Ctrl+Shift+Q` → Close tab
- `Ctrl+Shift+H/J/K/L` → Navigate between splits

**Important:** `macos_option_as_alt yes` is set in config

### ✅ Hammerspoon (replaces cos-switch)
On Linux, you use `cos-switch` (Rust) to launch/focus apps with keyboard shortcuts.
On macOS, **Hammerspoon** provides the same functionality:

**App Launching Shortcuts:**
- `Ctrl+1` → Zen Browser
- `Ctrl+2` → Comet Browser
- `Ctrl+3` → kitty Terminal
- `Ctrl+4` → Slack

Config location: `~/.hammerspoon/init.lua`

### ✅ Browser Tab Switching
Browsers (Comet, Zen, Chrome) are configured to use **Alt+1-9** for tab switching.
This keeps `Ctrl+1-4` free for Hammerspoon app launching.

## Differences from Linux

| Linux | macOS | Notes |
|-------|-------|-------|
| `cos-switch` (Rust) | Hammerspoon (Lua) | App switching/launching |
| Cosmic WM shortcuts | Mission Control disabled | Freed up Ctrl+1-9 |
| `cos-cli activate` | `hs.application.launchOrFocus()` | Focus/launch apps |
| Native Alt key | `macos_option_as_alt yes` | Kitty config required |

## Maintenance

### Update dotfiles
```bash
cd ~/dotfiles
git pull
```

### Add/Edit Apps in Hammerspoon
Edit `~/.hammerspoon/init.lua`:
```lua
hs.hotkey.bind({ "ctrl" }, "5", function()
    launchFocusMaximize("YourApp")
end)
```

### Reinstall symlinks
```bash
~/dotfiles/setup_macos.sh
```

## Backups

Your original configs were backed up to:
- `~/.config/kitty.backup.YYYYMMDD_HHMMSS/`
- `~/.config/nvim.backup.YYYYMMDD_HHMMSS/`
- `~/.zshrc.backup.YYYYMMDD_HHMMSS`

## Notes

- ❌ `cos-switch` is **not needed** on macOS (Linux-only)
- ✅ Hammerspoon provides equivalent functionality
- ✅ All kitty shortcuts work the same (Alt+1-9)
- ✅ Symlinks allow you to edit dotfiles in `~/dotfiles/` and changes apply immediately
