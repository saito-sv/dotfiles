## Dotfiles

These dotfiles are structured for the XDG base directory spec on both macOS and Ubuntu 24.04.

### Install

```sh
git clone git@github.com:saito-sv/dotfiles.git ~/dotfiles
```

### Symlinks (macOS + Ubuntu)

```sh
ln -sfn ~/dotfiles/kitty ~/.config/kitty
ln -sfn ~/dotfiles/nvim ~/.config/nvim
```

### Notes

- Auto-generated files (e.g. Neovim lockfiles, Kitty auto theme, macOS artifacts) are ignored.
- Kitty theme is set via `kitty/kitty.conf` and includes `dracula-theme.conf`.
