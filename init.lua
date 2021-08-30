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

require('impatient')
require("plugins.notifications")

require("plugins.auto-pairs")
require("plugins.auto-save")
require("plugins.bookmarks")
require("plugins.completion-icons")
require("plugins.completion")
require("plugins.file-tree")
require("plugins.finder")
require("plugins.formatter-linter")
require("plugins.git-status")
require("plugins.icons")
require("plugins.indent-line")
require("plugins.markdown-preview")
require("plugins.plugin-manager")
require("plugins.project-manager")
require("plugins.package-info")
require("plugins.scroll")
require("plugins.snippets")
require("plugins.spellcheck")
require("plugins.start-screen")
require("plugins.status-line")
require("plugins.terminal")
require("plugins.todo-comments")
require("plugins.undo-tree")

------------------------------------------------------------------------------------------
----------------------------------- LSPs -------------------------------------------------
------------------------------------------------------------------------------------------

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
require("lsp.diagnostics")
