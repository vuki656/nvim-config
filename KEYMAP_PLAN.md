# Keymap Reorganization Plan

## The Dual-Leader System

Two leader keys, mirrored for ergonomics on a Moonlander split keyboard:

- **`<Leader>`** (left thumb) → right-hand prefix → left-hand action = **navigate, find, manage**
- **`<LocalLeader>`** (right thumb) → left-hand action key = **execute, run, act on code**

`<LocalLeader>` needs no category prefix — the key itself IS the context ("do something"). This turns 4-key combos into 2-key combos for test runner.

### Setup

In `lua/settings.lua`, add:
```lua
vim.g.maplocalleader = "<key>" -- right-thumb key on Moonlander
```

### Naming Logic

Every `<Leader>` binding follows: **prefix = category noun (right hand)**, **action = verb/specifier (left hand)**

The prefix tells you WHAT DOMAIN, the action tells you WHAT TO DO:
- `p` = **P**roject (anything that searches across the project via Telescope)
- `l` = **L**anguage (code operations + dev tool launchers — all "L-word" tools: LSP, Lazy, Language)
- `h` = **H**unk (git — hunks are the atomic unit of git changes)
- `m` = **M**ark (harpoon bookmarks)
- `i` = **I**nspect (debug/DAP — inspecting program state)
- `o` = **O**pen (toggle a UI panel or tool window)
- `u` = **U**tility (rarely used maintenance/config actions)
- `k` = **K**ill (destroy/close things)

### Description Format

All descriptions will be prefixed with the plugin/source name in brackets for searchability:

```
"[Telescope] Find files in project"
"[Gitsigns] Reset current hunk"
"[Neotest] Run closest test"
```

---

## LocalLeader Bindings (right thumb + left-hand key)

These moved to `<LocalLeader>` because they are "execution" actions and benefit most from the 2-key shortcut.

| Key | Old | Description | Why this key | Why LocalLeader |
|-----|-----|-------------|--------------|-----------------|
| `r` | `<Leader>jrt` | [Neotest] Run closest test | **r** = run | Most common test action, was 4 keys, now 2 |
| `f` | `<Leader>jrf` | [Neotest] Run current file | **f** = file | Second most common test action |
| `a` | `<Leader>jrr` | [Neotest] Run again (last test) | **a** = again | "Run again" — rerun last |
| `s` | `<Leader>jro` | [Neotest] Open test summary | **s** = summary | View test results overview |
| `e` | `<Leader>jrl` | [Neotest] Show test errors/output | **e** = errors | View test output/failures |
| `t` | `<Leader>jrp` | [Neotest] Toggle output panel | **t** = toggle | Toggle persistent panel |
| `d` | `<Leader>jrd` | [Neotest] Debug closest test | **d** = debug | Run test with debugger attached |

**File**: `lua/plugins/test-runner.lua`

---

## Leader Bindings (Old → New)

### Project `p` — Telescope Finders

Everything that searches/finds across the project. Unifies all Telescope pickers under one prefix.

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `pf` | `pf` | [Telescope] Find files in project | Unchanged | **f** = files |
| `ps` | `ps` | [Telescope] Search text in project | Unchanged | **s** = search |
| `pg` | `pg` | [Telescope] Find changed git files | Unchanged | **g** = git |
| `pd` | `pd` | [Telescope] Find LSP definitions | Unchanged | **d** = definitions |
| `pr` | `pr` | [Telescope] Find LSP references | Unchanged | **r** = references |
| `pi` | `pi` | [Telescope] Find LSP implementations | Unchanged | **i** = implementations (both R-hand, but too mnemonic to change) |
| `pt` | `pt` | [Telescope] Find TODOs in project | Unchanged | **t** = todos |
| `pc` | `bc` | [Telescope] Browse buffer commits | Was `bc` — `b` prefix wasn't a category. Moved under `p` since it's a Telescope picker | **c** = commits |
| `pw` | `rp` | [Spectre] Project-wide search and replace | Was `rp` — `r` is left hand (bad first key). Spectre searches the whole project, fits `p` | **w** = wide (project-wide) |
| `pa` | `gh` | [Telescope] Find in help pages | Was `gh` — `g` is left hand. Help is a project-level resource | **a** = assist/help |

**Files**: `lua/plugins/finder.lua`, `lua/plugins/todo.lua`, `lua/plugins/replace.lua`

### Language `l` — Code Ops + Tool Launchers

Code operations (format, rename) and dev tool launchers. The unifying concept: all start with "L" words (Language, LSP, Lazy, Launch) or are core dev workflow tools.

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `lf` | `fp` | [Conform] Format current buffer | Was `fp` — `f` is left hand (bad first key). "Language format" reads naturally | **f** = format |
| `lr` | `rn` | [LSP] Rename variable under cursor | Was `rn` — `r` is left hand. "Language rename" | **r** = rename |
| `lg` | `lg` | [Terminal] Open lazygit in tmux | Unchanged — already perfect: l(R)+g(L), mnemonic "lazygit" | **g** = git |
| `ld` | `ld` | [Terminal] Open lazydocker | Unchanged — l(R)+d(L), mnemonic "lazydocker" | **d** = docker |
| `ls` | `ls` | [Mason] Open LSP installer | Unchanged — l(R)+s(L), mnemonic "LSP setup" | **s** = setup |
| `lz` | `lz` | [Lazy] Open plugin manager | Unchanged — l(R)+z(L), mnemonic "lazy" | **z** = lazy (laZy) |
| `lt` | `lt` | [SplitJoin] Toggle args single/multi line | Unchanged — l(R)+t(L) | **t** = toggle |
| `le` | `ras` | [Terminal] Run package.json script | Was `ras` — 3 keys, `r` is left hand | **e** = execute |

**Files**: `lua/keymaps.lua`, `lua/plugins/formatter.lua`, `lua/plugins/terminal/init.lua`, `lua/plugins/split-join.lua`, `lua/plugins/installer.lua`, `lua/plugins/plugin-manager.lua`

### Hunk `h` — Git Operations

All git-related actions. "Hunk" is the atomic unit of git changes (gitsigns uses hunks). Conflict resolution and git linker are also git operations.

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `hr` | `hr` | [Gitsigns] Reset current hunk | Unchanged — h(R)+r(L) | **r** = reset |
| `hb` | `hR` | [Gitsigns] Reset entire buffer to git state | Was `hR` — shift+key is awkward for a prefix combo | **b** = buffer |
| `hv` | `hp` | [Gitsigns] Preview hunk diff | Was `hp` — h+p both right hand | **v** = view (left hand, better alternation) |
| `hc` | `gl` | [GitLinker] Copy git permalink to clipboard | Was `gl` — `g` is left hand (bad first key). Copying a link is a git action | **c** = copy |
| `ht` | `gmt` | [GitConflict] Accept their changes | Was `gmt` — 3 keys, `g` is left hand | **t** = theirs |
| `ha` | `gmb` | [GitConflict] Accept both/all changes | Was `gmb` — 3 keys, `g` is left hand | **a** = all/both |
| `ho` | `gmo` | [GitConflict] Accept our changes | Was `gmo` — 3 keys, `g` is left hand | **o** = ours (both R-hand, but "ours" is unmistakable) |

**Files**: `lua/plugins/git-status.lua`, `lua/plugins/git-linker.lua`, `lua/plugins/git-conflict.lua`

### Mark `m` — Harpoon Bookmarks

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `ms` | `ms` | [Harpoon] Open marked files list | Unchanged — m(R)+s(L) | **s** = show |
| `mf` | `mf` | [Harpoon] Mark current file | Unchanged — m(R)+f(L) | **f** = file |
| `1-9` | `1-9` | [Harpoon] Jump to marked file slot | Unchanged | Numbers for indexed slots |

**File**: `lua/plugins/bookmarks.lua`

### Inspect `i` — Debug/DAP (essentials only)

Moved from `d` prefix because `d` is left hand (bad first key after leader). `i` = "inspect" and is right hand. Trimmed to 5 essential operations.

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `ib` | `db` | [DAP] Toggle breakpoint | `d` was left hand → `i` is right hand | **b** = breakpoint |
| `ic` | `dc` | [DAP] Start/continue debugging | Same reason | **c** = continue |
| `iq` | `dq` | [DAP] Terminate debug session | Same reason | **q** = quit |
| `in` | `dn` | [DAP] Step over (next line) | Same reason | **n** = next (both R-hand, acceptable for rare action) |
| `is` | `di` | [DAP] Step into function | Same reason | **s** = step (into) |

**File**: `lua/plugins/debugger.lua`

### Open `o` — UI Toggles

Anything that opens/toggles a UI panel, tool window, or buffer. The "o" prefix means "open this thing."

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `ot` | `tm` | [Terminal] Open floating terminal | Was `tm` — `t` is left hand | **t** = terminal |
| `ou` | `uo`+`uc` | [UndoTree] Toggle undo tree | Was split into separate open (`uo`) and close (`uc`). Merged into one toggle | **u** = undo (both R-hand, but "undo" is unmistakable) |
| `oz` | `fm` | [ZenMode] Toggle zen/focus mode | Was `fm` — `f` is left hand. "Zen" is the actual plugin name | **z** = zen |
| `of` | `to` | [NvimTree] Find current file in tree | Was `to` — `t` is left hand | **f** = find |
| `or` | `sr`(search) | [SearchReplace] Open search and replace dialog | Was `sr` — `s` is left hand AND conflicted with spell recreate | **r** = replace |
| `os` | `bb` | [Alpha] Open start screen | Was `bb` — `b` prefix wasn't a category, redundant double-tap | **s** = start |
| `ob` | `ro` | [Vim] Switch to previous buffer | Was `ro` — `r` is left hand | **b** = buffer (previous) |
| `ok` | `km` | [Telescope] Open keymaps picker | Was `km` — `k` is now the "kill" prefix | **k** = keymaps (both R-hand, moderate use) |

**Files**: `lua/plugins/terminal/init.lua`, `lua/plugins/undo-tree.lua`, `lua/plugins/focus.lua`, `lua/plugins/file-tree.lua`, `lua/plugins/search-replace.lua`, `lua/plugins/start-screen.lua`, `lua/keymaps.lua`

### Utility `u` — Rarely Used Misc

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `um` | `mm` | [Vim] Show neovim messages log | Was `mm` — redundant double-tap, no category prefix | **m** = messages (both R-hand, very rarely used) |
| `ut` | `ts` | [Treesitter] Inspect highlight group under cursor | Was `ts` — `t` is left hand | **t** = treesitter |

**Files**: `lua/keymaps.lua`, `lua/plugins/parser.lua`

### Kill `k`

| New | Old | Description | Why changed | Why this key |
|-----|-----|-------------|-------------|--------------|
| `kb` | `ki` | [BufClose] Kill all inactive buffers | Was `ki` — changed action key for consistency: "kill buffers" | **b** = buffers |

**File**: `lua/plugins/buffer-closer.lua`

---

## Non-Leader Changes

| New | Old | Description | Why changed |
|-----|-----|-------------|-------------|
| `]q` / `[q` | `<Leader>qn` / `qp` | [Vim] Next/prev quickfix item | Bracket nav (`]x`/`[x`) is standard Neovim idiom — matches your existing `]d`/`[d` and `]c`/`[c`. Only 2 keys instead of 3. `]` is right hand, `q` is left hand. |
| `]g` / `[g` | `<Leader>gmn` / `gmp` | [GitConflict] Next/prev conflict | Same bracket pattern. Was 4 keys, now 2. No vim built-in conflict. |

---

## Removals

| Old | Description | Why removed | Alternative |
|-----|-------------|-------------|-------------|
| `<Leader>d` | Delete everything on the line | `d` is left hand (bad). Vim already has this | `S<Esc>` or `cc<Esc>` |
| `<Leader>tr` | Refresh file tree | `t` is left hand. Redundant with tree-internal `R` key | Open tree with `<C-n>`, press `R` |
| `<Leader>tk` | Collapse all tree nodes | `t` is left hand. Redundant with tree-internal `W` key | Open tree with `<C-n>`, press `W` |
| `<Leader>pe` (was `pad`) | Project diagnostics (Telescope) | User doesn't use | Removed |
| `<Leader>hl` | Highlights (Telescope) | User doesn't use | Removed |
| `<Leader>lp` (was `f0`) | Prettier format override | User doesn't use | Removed |
| `<Leader>ma` | Delete all marks | User doesn't use | Removed |
| `<Leader>md` | Delete line mark | User doesn't use | Removed |
| `<Leader>dB` | Conditional breakpoint | Trimmed debug to essentials | Removed |
| `<Leader>do` | Step out | Trimmed debug to essentials | Removed |
| `<Leader>du` | Toggle DAP UI | Trimmed debug to essentials | Removed |
| `<Leader>de` | Eval expression | Trimmed debug to essentials | Removed |
| `<Leader>dh` | Hover variable | Trimmed debug to essentials | Removed |
| `<Leader>sw` | Enable wrap | User doesn't use | `:set wrap` |
| `<Leader>rs` | Resource lua file | User doesn't use | `:luafile %` |
| `<Leader>sr` | Recreate spell db | User doesn't use | `:mkspell!` |
| `<Leader>cw` | Word count | User doesn't use | `g<C-g>` |
| `<Leader>lf` (spell) | Fix first misspell | User doesn't use | Removed |
| `<Leader>kur` | HTTP run (kulala) | User doesn't use | Removed |

---

## Unchanged Non-Leader Keymaps (preserved as-is)

- `L` / `H` — hover / diagnostic (right+left alternation)
- `ga` — code action
- `]d` / `[d` — diagnostic nav
- `]c` / `[c` — git hunk nav
- `<C-n>` — toggle file tree
- `<C-h/j/k/l>` — window navigation
- `<C-s/a>` — window resize
- `<C-w/e>` — treesitter incremental selection
- `<C-o>` — Copilot accept (insert mode)
- `gj` / `gk` — insert empty line below/above
- `gim` — terminal normal mode
- `g?d` — delete debug prints
- `J` / `K` / `M` / `V` / `vv` — line editing overrides
- `n` / `N` — centered search
- `<BS>` — clear highlight
- `zn` / `zp` / `zf` — spellcheck nav
- `jj` / `jk` / `kj` / `kk` — escape insert mode
- `q:` — disabled

---

## Bug Fix

`<Leader>sr` is currently mapped to BOTH "recreate spell db" (`keymaps.lua:289`) and "search and replace" (`search-replace.lua`). Resolved: spell recreate removed, search-replace moved to `or`.

---

## Files to Modify

1. `lua/settings.lua` — add `vim.g.maplocalleader`
2. `lua/keymaps.lua` — remove/change 12 bindings (lsp, misc, navigation, line editing)
3. `lua/plugins/finder.lua` — rename `bc`→`pc`, remove `pad` and `hl`, rename `gh`→`pa`
4. `lua/plugins/debugger.lua` — change 5 bindings (d→i prefix), remove 5 others
5. `lua/plugins/test-runner.lua` — 7 bindings moved to `<LocalLeader>`
6. `lua/plugins/git-conflict.lua` — 3 merge bindings shortened, 2 nav moved to `]g`/`[g`
7. `lua/plugins/git-status.lua` — `hR`→`hb`, `hp`→`hv`
8. `lua/plugins/git-linker.lua` — `gl`→`hc`
9. `lua/plugins/formatter.lua` — `fp`→`lf`
10. `lua/plugins/terminal/init.lua` — `tm`→`ot`, `ras`→`le`
11. `lua/plugins/replace.lua` — `rp`→`pw`
12. `lua/plugins/search-replace.lua` — `sr`→`or`
13. `lua/plugins/file-tree.lua` — `to`→`of`, remove `tr` and `tk`
14. `lua/plugins/focus.lua` — `fm`→`oz`
15. `lua/plugins/undo-tree.lua` — merge `uo`+`uc` into single `ou` toggle
16. `lua/plugins/start-screen.lua` — `bb`→`os`
17. `lua/plugins/bookmarks.lua` — update descriptions with `[Harpoon]` prefix
18. `lua/plugins/http.lua` — remove `kur` binding
19. `lua/plugins/buffer-closer.lua` — `ki`→`kb`
20. `lua/plugins/parser.lua` — `ts`→`ut`

## Verification

1. Open Neovim — confirm no startup errors
2. Run `<Leader>ok` (keymaps picker) — verify all new bindings appear with `[Plugin]` prefixed descriptions
3. Spot-check leader categories: `pf` (files), `lf` (format), `hr` (hunk), `ot` (terminal)
4. Spot-check localleader: `<LocalLeader>r` (run test)
5. Verify `]q`/`[q` work for quickfix navigation
6. Grep codebase for leftover old keymap strings (e.g. `<LEADER>rn`, `<LEADER>fp`, `<LEADER>db`, `<LEADER>jr`)
