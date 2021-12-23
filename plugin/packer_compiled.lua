-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/domagojvukovic/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/domagojvukovic/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/domagojvukovic/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/domagojvukovic/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/domagojvukovic/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "require('plugins.start-screen')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["autosave.nvim"] = {
    config = { "require('plugins.auto-save')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/autosave.nvim",
    url = "https://github.com/pocco81/autosave.nvim"
  },
  ["close-buffers.nvim"] = {
    config = { "require('plugins.buffer-closer')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["comment.nvim"] = {
    config = { "require('plugins.commenting')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/comment.nvim",
    url = "https://github.com/numtostr/comment.nvim"
  },
  ["feline.nvim"] = {
    config = { "require('plugins.status-line')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "require('plugins.git-linker')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.git-status')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "require('plugins.bookmarks')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["headlines.nvim"] = {
    config = { "require('plugins.doc-highlighter')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugins.indent-line')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "require('plugins.completion-icons')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "require('plugins.markdown-preview')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["minsnip.nvim"] = {
    config = { "require('plugins.snippets')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/minsnip.nvim",
    url = "https://github.com/jose-elias-alvarez/minsnip.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "require('plugins.scrollbar')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/muniftanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "require('plugins.formatter-linter')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.auto-pairs')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    config = { "require('plugins.action-menu')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "require('plugins.notifications')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollview"] = {
    config = { "require('plugins.smooth-scroll')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "require('plugins.terminal')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "require('plugins.file-tree')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/joosepalviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    after = { "nvim-tree.lua" },
    loaded = true,
    only_config = true
  },
  ["octo.nvim"] = {
    config = { "require('plugins.github-integration')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["package-info.nvim"] = {
    config = { "require('plugins.package-info')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    config = { "require('plugins.plugin-manager')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "require('plugins.treesitter')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "require('plugins.project-manager')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugins.finder')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "require('plugins.todo-comments')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  undotree = {
    config = { "require('plugins.undo-tree')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-illuminate"] = {
    config = { "require('plugins.word-highlighter')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/rrethy/vim-illuminate"
  },
  ["vim-startuptime"] = {
    config = { "require('plugins.profiler')" },
    loaded = true,
    path = "/home/domagojvukovic/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
require('plugins.plugin-manager')
time([[Config for packer.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('plugins.finder')
time([[Config for telescope.nvim]], false)
-- Config for: minsnip.nvim
time([[Config for minsnip.nvim]], true)
require('plugins.snippets')
time([[Config for minsnip.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require('plugins.todo-comments')
time([[Config for todo-comments.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
require('plugins.bookmarks')
time([[Config for harpoon]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require('plugins.project-manager')
time([[Config for project.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require('plugins.formatter-linter')
time([[Config for null-ls.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
require('plugins.completion-icons')
time([[Config for lspkind-nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('plugins.start-screen')
time([[Config for alpha-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.git-status')
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
require('plugins.word-highlighter')
time([[Config for vim-illuminate]], false)
-- Config for: autosave.nvim
time([[Config for autosave.nvim]], true)
require('plugins.auto-save')
time([[Config for autosave.nvim]], false)
-- Config for: vim-startuptime
time([[Config for vim-startuptime]], true)
require('plugins.profiler')
time([[Config for vim-startuptime]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require('plugins.scrollbar')
time([[Config for neoscroll.nvim]], false)
-- Config for: close-buffers.nvim
time([[Config for close-buffers.nvim]], true)
require('plugins.buffer-closer')
time([[Config for close-buffers.nvim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
require('plugins.package-info')
time([[Config for package-info.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('plugins.indent-line')
time([[Config for indent-blankline.nvim]], false)
-- Config for: headlines.nvim
time([[Config for headlines.nvim]], true)
require('plugins.doc-highlighter')
time([[Config for headlines.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('plugins.completion')
time([[Config for nvim-cmp]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require('plugins.status-line')
time([[Config for feline.nvim]], false)
-- Config for: playground
time([[Config for playground]], true)
require('plugins.treesitter')
time([[Config for playground]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
require('plugins.github-integration')
time([[Config for octo.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
require('plugins.undo-tree')
time([[Config for undotree]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require('plugins.notifications')
time([[Config for nvim-notify]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
require('plugins.git-linker')
time([[Config for gitlinker.nvim]], false)
-- Config for: comment.nvim
time([[Config for comment.nvim]], true)
require('plugins.commenting')
time([[Config for comment.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
require('plugins.markdown-preview')
time([[Config for markdown-preview.nvim]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
require('plugins.smooth-scroll')
time([[Config for nvim-scrollview]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('plugins.icons')
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
require('plugins.terminal')
time([[Config for nvim-toggleterm.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
require('plugins.file-tree')

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require('plugins.auto-pairs')

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
