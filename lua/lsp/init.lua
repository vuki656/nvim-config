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
    "tailwindcss",
    "taplo",
    "terraformls",
    "tsc",
    "twiggy_language_server",
    "vimls",
    "yamlls",
    "ty",
}

for _, server in ipairs(M.servers) do
    local config = servers[server] or { capabilities = lsp_capabilities }

    vim.lsp.config(server, config)
end

vim.opt.autoread = true

local ignored_dot_dirs_cache = {}

local function ignored_dot_dirs(root)
    if ignored_dot_dirs_cache[root] then
        return ignored_dot_dirs_cache[root]
    end

    local names = {}

    for name, type in vim.fs.dir(root) do
        if type == "directory" and name:sub(1, 1) == "." and name ~= ".git" then
            table.insert(names, name)
        end
    end

    local ignored = {}

    if #names > 0 then
        local result = vim.system(vim.list_extend({ "git", "-C", root, "check-ignore" }, names), { text = true }):wait()

        ignored = vim.split(result.stdout or "", "\n", { trimempty = true })
    end

    ignored_dot_dirs_cache[root] = ignored

    return ignored
end

local watch = require("vim._watch")
local watchfiles = require("vim.lsp._watchfiles")

if watchfiles._watchfunc == watch.inotify then
    watchfiles._watchfunc = function(path, opts, callback)
        local ignored = ignored_dot_dirs(path)

        if #ignored == 0 then
            return watch.inotify(path, opts, callback)
        end

        local system = vim.system

        vim.system = function(cmd, ...)
            for _, name in ipairs(ignored) do
                table.insert(cmd, #cmd, "@" .. vim.fs.joinpath(path, name))
            end

            return system(cmd, ...)
        end

        local ok, cancel = pcall(watch.inotify, path, opts, callback)

        vim.system = system

        if not ok then
            error(cancel)
        end

        return cancel
    end
end

local marker_dir = vim.fn.stdpath("state") .. "/external-sync"

vim.fn.mkdir(marker_dir, "p")

local running_syncs = {}

local function changed_file_events(root, on_events)
    local marker = vim.fs.joinpath(marker_dir, (root:gsub("[^%w]", "-")))
    local stamp = marker .. ".stamp"

    vim.fn.writefile({}, stamp)

    if not vim.uv.fs_stat(marker) then
        vim.uv.fs_rename(stamp, marker)
        return
    end

    local cmd = { "find", root, "(", "-name", "node_modules", "-o", "-name", ".git", "-o", "-name", ".next" }

    vim.list_extend(cmd, { "-o", "-name", "dist" })

    for _, name in ipairs(ignored_dot_dirs(root)) do
        vim.list_extend(cmd, { "-o", "-path", vim.fs.joinpath(root, name) })
    end

    vim.list_extend(cmd, { ")", "-prune", "-o", "-type", "f", "-newer", marker, "-print" })

    running_syncs[root] = true

    vim.system(
        cmd,
        { text = true },
        vim.schedule_wrap(function(result)
            running_syncs[root] = nil
            vim.uv.fs_rename(stamp, marker)

            local events = {}

            for _, path in ipairs(vim.split(result.stdout or "", "\n", { trimempty = true })) do
                table.insert(events, { uri = vim.uri_from_fname(path), type = 1 })
            end

            if #events > 0 then
                on_events(events)
            end
        end)
    )
end

local function notify_watched_files(events)
    for _, client in ipairs(vim.lsp.get_clients()) do
        client:notify("workspace/didChangeWatchedFiles", { changes = events })
    end
end

local function sync_watched_files()
    local synced_roots = {}

    for _, client in ipairs(vim.lsp.get_clients()) do
        local root = client.root_dir and (vim.fs.root(client.root_dir, ".git") or client.root_dir)

        if root and root ~= vim.uv.os_homedir() and not synced_roots[root] and not running_syncs[root] then
            synced_roots[root] = true
            changed_file_events(root, notify_watched_files)
        end
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
