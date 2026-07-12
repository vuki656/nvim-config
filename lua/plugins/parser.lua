-- Name: Treesitter Nvim
-- Description: Treesitter proxy for nvim
-- Link: https://github.com/nvim-treesitter/nvim-treesitter

local set_keymap = require("utils.set-keymap")

local MAX_HIGHLIGHT_LINES = 10000

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require("nvim-treesitter").install("all")

vim.treesitter.language.register("bash", "env")

local function enable_treesitter(event)
    local buffer = event.buf

    if vim.api.nvim_buf_line_count(buffer) > MAX_HIGHLIGHT_LINES then
        return
    end

    local language = vim.treesitter.language.get_lang(vim.bo[buffer].filetype)

    if not language then
        return
    end

    local ok, parser_added = pcall(vim.treesitter.language.add, language)

    if not ok or not parser_added then
        return
    end

    vim.treesitter.start(buffer, language)

    vim.bo[buffer].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = enable_treesitter,
})

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ut",
    actions = function()
        vim.cmd(":Inspect")
    end,
    description = "[Treesitter] Inspect highlight group under cursor",
})
