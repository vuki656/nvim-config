# NVIM Configuration

<img src="https://github.com/vuki656/vuki656/blob/master/media/nvim-config/screen.png" width=1000>

## Project Structure

    ├── lua                                 # Source code
    │   ├── lsp                             # Language server related configuration files
    │   │   ├── utils                       # Language server related utility files
    │   │   └── xxx.lua                     # Language server configuration for a specific language
    │   ├── plugins                         # Plugin configuration files
    │   ├── utils                           # Shared project utilities
    │   │   ├── keymaps                     # More complex keymaps
    │   │   ├── set-highlight.lua           # Highlight setting utility
    │   │   └── set-keymap.lua              # Keymap setting utility
    │   ├── colorscheme.lua                 # Editor color configuration
    │   ├── keymaps.lua                     # Editor keymaps
    │   ├── plugins.lua                     # Installed plugins
    │   └── settings.lua                    # Editor settings
    ├── spell                               # Custom dictionary word database
    └── init.lua                            # Project entry file from where everything is initialized

## Installation

1. Install `packer` using `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. Open `nvim` and run `PackerSync`
3. Restart `nvim`

## Notes

- When changing node version with `nvm`, all global `NPM` packages have to be reinstalled.
