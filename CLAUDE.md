# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. The config prioritizes TypeScript/JavaScript development with extensive LSP, formatting, and linting support.

## Architecture

### Initialization Flow
`init.lua` → loads in order: settings → plugins → lsp → keymaps → colorscheme → ui

### Key Directories
- `lua/plugins/` - Individual plugin configurations (one file per plugin)
- `lua/plugins/snippets/` - LuaSnip snippets organized by language
- `lua/plugins/status-line/` - Feline statusline components
- `lua/plugins/terminal/` - Toggleterm keymaps and configuration
- `lua/utils/` - Shared utilities (colors, icons, keymap helpers)
- `lua/ui/` - Custom UI overrides (input, select, loading)
- `spell/` - Custom dictionary

### Utility Patterns
- `set-keymap.lua` - Wrapper for `vim.keymap.set` accepting single or list of keymaps
- `set-highlight.lua` - Batch highlight group definitions
- `set-sign.lua` - Batch sign definitions
- `colors.lua` - Centralized One Dark color palette

### Plugin Configuration Pattern
Each plugin has its own file in `lua/plugins/` that handles setup, keymaps, and highlights for that plugin. The file is loaded via `require("plugins.<name>")` in `plugins.lua`.

## Key Keymaps (Leader = Space)

| Key | Action |
|-----|--------|
| `<Leader>pf` | Find files (Telescope) |
| `<Leader>ps` | Live grep (Telescope) |
| `<Leader>fp` | Format file (formatter.nvim or LSP) |
| `<Leader>lg` | Open lazygit in tmux |
| `<Leader>ld` | Open lazydocker |
| `<Leader>ot` | Open floating terminal |
| `<Leader>ls` | Open Mason installer |
| `<Leader>lre` | Restart LSP |
| `L` | Hover documentation |
| `H` | Show diagnostic |
| `ga` | Code actions |

## LSP Configuration

LSP servers are defined in `lua/lsp.lua` and auto-installed via Mason. The config uses `vim.lsp.config()` (Neovim 0.11+ API) for server configuration.

Servers with custom config: angularls, cssmodules_ls, jsonls, yamlls

TypeScript uses `tsgo` (native TS LSP). The typescript-tools.nvim plugin code is commented out but available.

## Formatting & Linting

**Formatter** (`lua/plugins/formatter.lua`):
- JavaScript/TypeScript: eslint_d (if .eslintrc.js exists) or Prettier
- Lua: stylua
- Python: black
- CSS: stylelint + prettier
- Go: gofmt

**Linter** (`lua/plugins/linter.lua`):
- Runs on BufWritePost
- Lua: luacheck, Dockerfile: hadolint, Shell: shellcheck, CSS: stylelint, YAML: yamllint + actionlint

## Custom Filetypes

Defined in `lua/settings.lua`:
- `.env*` → dotenv
- `.mdx` → markdown
- `.http` → http
- `Jenkinsfile` → groovy

## Notes

- When changing Node version with nvm, global NPM packages (prettier, eslint_d, etc.) must be reinstalled
- Colorscheme is custom One Dark defined entirely in `lua/colorscheme.lua`
- Spellcheck is enabled by default with camelCase support
