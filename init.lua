------------------------------------------------------------------------------------------
----------------------------------- CORE -------------------------------------------------
------------------------------------------------------------------------------------------

require("plugins")
require("settings")
require("keymaps")
require("colorscheme")

------------------------------------------------------------------------------------------
----------------------------------- PLUGINS ----------------------------------------------
------------------------------------------------------------------------------------------

require("impatient")

require("plugins.notifications")

require("plugins.action-menu")
require("plugins.auto-save")
require("plugins.bookmarks")
require("plugins.buffer-closer")
require("plugins.completion-icons")
require("plugins.commenting")
require("plugins.finder")
require("plugins.word-highlight")
require("plugins.formatter-linter")
require("plugins.git-status")
require("plugins.indent-line")
require("plugins.markdown-preview")
require("plugins.plugin-manager")
require("plugins.project-manager")
require("plugins.package-info")
require("plugins.smooth-scroll")
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

require("plugins.icons")
require("plugins.file-tree")

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
require("lsp.yaml")

require("lsp.utils.diagnostics")
