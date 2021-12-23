local function collapse_tree_node(node)
    local entries = node.entries

    if not entries then
        return
    end

    for _, entry in pairs(entries) do
        collapse_tree_node(entry)
    end

    node.open = false
end

function _G.collapse_tree()
    local lib = require("nvim-tree.lib")

    collapse_tree_node(lib.Tree)

    lib.refresh_tree()
end
