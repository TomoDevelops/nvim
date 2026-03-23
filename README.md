# Neovim Config

## Prerequisites

### Neovim (nightly)
```bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
mv nvim-macos-arm64 ~/.local/share/nvim-nightly
sudo ln -sf ~/.local/share/nvim-nightly/bin/nvim /usr/local/bin/nvim
rm nvim-macos-arm64.tar.gz
```

### External dependencies
```bash
brew install ripgrep fd
brew install --cask font-terminess-ttf-nerd-font
npm install -g eslint_d
```

### Set terminal font
Set **TerminessTTF Nerd Font** in your terminal app's preferences.

## Setup
```bash
git clone <repo-url> ~/.config/nvim
nvim
```

Plugins, LSP servers, and treesitter parsers install automatically on first launch.
