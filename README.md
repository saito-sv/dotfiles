## Dotfiles

Personal dotfiles for macOS and Ubuntu 24.04.

---

### Install

```sh
git clone git@github.com:saito-sv/dotfiles.git ~/dotfiles
```

---

### Dependencies

#### Zsh + Zap

```sh
# Ubuntu only
sudo apt install zsh -y && chsh -s $(which zsh)

# Install Zap (plugin manager)
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

#### CLI tools

```sh
# macOS
brew install fd fzf tree mise lazygit neovim nvm go podman

# Ubuntu
sudo apt install fd-find fzf tree lazygit neovim golang podman -y
sudo ln -s $(which fdfind) /usr/local/bin/fd

# mise (if not installed via brew/apt)
curl https://mise.run | sh

# nvm (if not installed via brew)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

#### Kitty

```sh
# macOS
brew install --cask kitty

# Ubuntu
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

Requires **Fira Code** and **Symbols Nerd Font Mono**:

```sh
# macOS
brew install --cask font-fira-code font-symbols-only-nerd-font

# Ubuntu
sudo apt install fonts-firacode -y
# Symbols Nerd Font: https://www.nerdfonts.com/font-downloads
```

---

### Symlinks

```sh
ln -sfn ~/dotfiles/kitty ~/.config/kitty
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/zsh/.zshrc ~/.zshrc
```

---

### cos-switch (Linux only)

App switcher/launcher that uses `cos-cli` to focus a running app by `app_id`, launching it if not already open. Configured apps: zen, kitty, slack, firefox, obsidian.

```sh
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Build and install to ~/.local/bin
cd ~/dotfiles/cos-switch && make install
```
