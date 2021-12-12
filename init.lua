------------------------------------------------------------------------------------------
----------------------------------- CORE -------------------------------------------------
------------------------------------------------------------------------------------------

require("plugins")
require("sets")
require("remaps")
require("colorscheme")

------------------------------------------------------------------------------------------
----------------------------------- PLUGINS ----------------------------------------------
------------------------------------------------------------------------------------------

require("impatient")

require("plugins.notifications")
require("plugins.auto-save")
require("plugins.bookmarks")
require("plugins.completion-icons")
require("plugins.commenting")
require("plugins.file-tree")
require("plugins.finder")
require("plugins.word-highlight")
require("plugins.formatter-linter")
require("plugins.git-status")
require("plugins.icons")
require("plugins.indent-line")
require("plugins.markdown-preview")
require("plugins.mode-switch-fix")
require("plugins.plugin-manager")
require("plugins.project-manager")
require("plugins.package-info")
require("plugins.scroll")
require("plugins.scrollbar")
require("plugins.snippets")
require("plugins.start-screen")
require("plugins.terminal")
require("plugins.todo-comments")
require("plugins.undo-tree")
require("plugins.status-line")

-- Order required
require("plugins.auto-pairs")
require("plugins.completion")

------------------------------------------------------------------------------------------
----------------------------------- LSPs -------------------------------------------------
------------------------------------------------------------------------------------------

require("lsp.solidity")
require("lsp.bash")
require("lsp.css")
require("lsp.docker")
require("lsp.graphql")
require("lsp.html")
require("lsp.json")
require("lsp.lua")
require("lsp.ts")
require("lsp.teal")
require("lsp.yaml")
require("lsp.prisma")
require("lsp.tailwind")
require("lsp.diagnostics")
