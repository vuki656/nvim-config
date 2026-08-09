local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_file_operations = require("lsp-file-operations")
local servers = require("lsp.servers")

lsp_file_operations.setup()

vim.diagnostic.config({
    signs = false,
    underline = true,
    virtual_text = false,
    float = {
        border = "rounded",
    },
})

local M = {}

M.servers = {
    "angularls",
    "bashls",
    "buf_ls",
    "css_variables",
    "cssls",
    "cssmodules_ls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "lemminx",
    "lua_ls",
    "phpactor",
    "prismals",
    "pyright",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tsgo",
    "twiggy_language_server",
    "vimls",
    "yamlls",
    "ty"
}

for _, server in ipairs(M.servers) do
    local config = servers[server] or { capabilities = lsp_capabilities }

    vim.lsp.config(server, config)
end

vim.opt.autoread = true

local marker_dir = vim.fn.stdpath("state") .. "/external-sync"

vim.fn.mkdir(marker_dir, "p")

local function changed_file_events(root)
    local marker = vim.fs.joinpath(marker_dir, (root:gsub("[^%w]", "-")))
    local stamp = marker .. ".stamp"

    vim.fn.writefile({}, stamp)

    local events = {}

    if vim.uv.fs_stat(marker) then
        local paths = vim.fn.systemlist(
            "find " .. vim.fn.shellescape(root)
                .. " \\( -name node_modules -o -name .git -o -name .next -o -name dist \\)"
                .. " -prune -o -type f -newer " .. vim.fn.shellescape(marker) .. " -print"
        )

        for _, path in ipairs(paths) do
            table.insert(events, { uri = vim.uri_from_fname(path), type = 1 })
        end
    end

    vim.uv.fs_rename(stamp, marker)

    return events
end

local function sync_watched_files()
    local events = {}
    local synced_roots = {}

    for _, client in ipairs(vim.lsp.get_clients()) do
        local root = client.root_dir and (vim.fs.root(client.root_dir, ".git") or client.root_dir)

        if root and not synced_roots[root] then
            synced_roots[root] = true
            vim.list_extend(events, changed_file_events(root))
        end
    end

    if #events == 0 then
        return
    end

    for _, client in ipairs(vim.lsp.get_clients()) do
        client:notify("workspace/didChangeWatchedFiles", { changes = events })
    end
end

local function sync_external_state()
    if vim.fn.mode() == "c" then
        return
    end

    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(buffer)

        if vim.api.nvim_buf_is_loaded(buffer) and vim.bo[buffer].buftype == "" and name:sub(1, 1) == "/" then
            if vim.uv.fs_stat(name) then
                vim.api.nvim_buf_call(buffer, function()
                    vim.cmd("silent! checktime")
                end)
            elseif not vim.bo[buffer].modified and vim.fn.bufwinid(buffer) == -1 then
                pcall(vim.api.nvim_buf_delete, buffer, {})
            end
        end
    end

    sync_watched_files()
end

vim.uv.new_timer():start(3000, 3000, vim.schedule_wrap(sync_external_state))

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspDisableSemanticTokens", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

vim.api.nvim_create_user_command("LspRestart", function(kwargs)
    local name = kwargs.fargs[1]

    for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
        local bufs = vim.lsp.get_buffers_by_client_id(client.id)

        client:stop()

        vim.wait(30000, function()
            return vim.lsp.get_client_by_id(client.id) == nil
        end)

        local client_id = vim.lsp.start(client.config, { attach = false })

        if client_id then
            for _, buf in ipairs(bufs) do
                vim.lsp.buf_attach_client(buf, client_id)
            end
        end
    end
end, {
    nargs = "?",
    complete = function()
        return vim.tbl_map(function(client)
            return client.name
        end, vim.lsp.get_clients())
    end,
})

return M
