# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. The config prioritizes TypeScript/JavaScript development with extensive LSP, formatting, and linting support. Requires Neovim 0.11+.

## Architecture

### Initialization Flow
`init.lua` → loads in order: settings → plugins → lsp → keymaps → colorscheme → ui

### Plugin Configuration Pattern
Each plugin has its own file in `lua/plugins/` following a consistent structure: header comment (Name, Description, Link), setup section, keymaps section, highlights section. Loaded via `require("plugins.<name>")` in `plugins.lua`. Keymaps within plugins use `require("utils.set-keymap")`.

### Utility Patterns
- `set-keymap.lua` - Wrapper for `vim.keymap.set` accepting single keymap or `{ list = {...} }` for batch definitions. Each keymap takes `key`, `actions`, `description`, and optional `modes` (defaults to `{ "n" }`)
- `set-highlight.lua` - Batch highlight group definitions
- `set-sign.lua` - Batch sign definitions
- `colors.lua` - Centralized One Dark color palette used across all highlight definitions

### Local/Dev Plugins
Two plugins loaded from local paths:
- `~/Projects/personal/driver.nvim` - AI chat plugin
- `~/Projects/personal/review.nvim` - Code review plugin

## Key Keymaps (Leader = Space)

| Key | Action |
|-----|--------|
| `<Leader>pf` | Find files (Telescope) |
| `<Leader>ps` | Live grep (Telescope) |
| `<Leader>lf` | Format file (conform.nvim, falls back to LSP) |
| `<Leader>lr` | LSP rename |
| `<Leader>lg` | Open lazygit in tmux |
| `<Leader>ld` | Open lazydocker |
| `<Leader>ot` | Open floating terminal |
| `<Leader>ls` | Open Mason installer |
| `L` | Hover documentation |
| `H` | Show diagnostic |
| `ga` | Code actions |
| `J` / `K` | Remove line below / above |
| `V` | Select to end of line (`vv` for whole line) |

## LSP Configuration

LSP servers defined in `lua/lsp/init.lua`, custom server configs in `lua/lsp/servers.lua`. Uses `vim.lsp.config()` (Neovim 0.11+ API). Auto-installed via Mason.

Servers with custom config: angularls, cssmodules_ls, jsonls, yamlls, lua_ls

TypeScript uses `tsgo` (native TS LSP). Semantic tokens are disabled globally via LspAttach autocmd. Custom `:LspRestart` command supports named server restart.

## Formatting & Linting

**Formatter** (`lua/plugins/formatter.lua`) — uses conform.nvim:
- JS/TS/React: prettier (eslint_d commented out)
- Lua: stylua
- Python: isort + black
- CSS: stylelint + prettier
- Go: gofmt
- Proto: buf
- SQL: sqlfluff
- `.env` files: whitespace trimming
- Default: falls back to LSP formatting

**Linter** (`lua/plugins/linter.lua`) — runs on BufWritePost:
- Lua: luacheck, Dockerfile: hadolint, Shell: shellcheck, CSS: stylelint
- YAML: yamllint + actionlint, PHP: phpstan + phpcs, SQL: sqlfluff

## Notable Behaviors

- **Auto-save**: Buffers auto-save on InsertLeave and TextChanged (excludes oil and harpoon filetypes)
- **Markdown/text**: Line wrapping enabled, `j`/`k` mapped to visual line movement
- **Spellcheck**: Enabled globally (en, hr), camelCase-aware, capitalized words ignored
- **Custom filetypes**: `.env*` → dotenv, `.mdx` → markdown, `.http` → http, `.map` → json, `Jenkinsfile` → groovy, `.luacheckrc` → lua, `.gitconfig.*` → gitconfig
- **Colorscheme**: Custom One Dark defined entirely in `lua/colorscheme.lua`
- When changing Node version with nvm, global NPM packages (prettier, eslint_d, etc.) must be reinstalled
