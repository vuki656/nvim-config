# NVIM Configuration

<img src="https://github.com/vuki656/vuki656/blob/master/media/nvim-config/screen.png" width=1000>

## Project Structure

    ├── lua                                 # Source code
    │   ├── lsp                             # Language server related configuration files
    │   ├── plugins                         # Plugin configuration files
    │   ├── utils                           # Shared project utilities
    │   ├── keymaps                         # Editor keymaps
    │   ├── colorscheme.lua                 # Editor color configuration
    │   ├── plugins.lua                     # Installed plugins
    │   └── settings.lua                    # Editor settings
    ├── spell                               # Custom dictionary word database
    └── init.lua                            # Project entry file from where everything is initialized

## Notes

-   When changing node version with `nvm`, all global `NPM` packages have to be reinstalled.
