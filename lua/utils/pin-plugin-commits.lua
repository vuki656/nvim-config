local MIN_AGE_DAYS = 3
local CACHE_TTL_SECONDS = 24 * 60 * 60
local CACHE_FILE = vim.fn.stdpath("cache") .. "/lazy-commit-pins.json"
local PLUGINS_DIR = vim.fn.stdpath("data") .. "/lazy"

local uv = vim.uv or vim.loop

local function read_cache()
    local file = io.open(CACHE_FILE, "r")

    if not file then
        return nil
    end

    local content = file:read("*a")

    file:close()

    local ok, cache = pcall(vim.json.decode, content)

    if ok and type(cache) == "table" and type(cache.commits) == "table" then
        return cache
    end

    return nil
end

local function write_cache(commits)
    local file = io.open(CACHE_FILE, "w")

    if not file then
        return
    end

    file:write(vim.json.encode({ commits = commits, checked_at = os.time() }))
    file:close()
end

local function collect(specs, list)
    for index, spec in ipairs(specs) do
        if type(spec) == "string" then
            spec = { spec }
            specs[index] = spec
        end

        if type(spec) == "table" then
            if type(spec.dependencies) == "string" then
                spec.dependencies = { spec.dependencies }
            end

            if type(spec.dependencies) == "table" then
                collect(spec.dependencies, list)
            end

            local repo = spec[1]
            local pinned = spec.dir or spec.commit or spec.tag or spec.version or spec.pin

            if type(repo) == "string" and not pinned then
                table.insert(list, {
                    name = spec.name or repo:match("[^/]+$"),
                    ref = spec.branch and ("origin/" .. spec.branch) or "origin/HEAD",
                    spec = spec,
                })
            end
        end
    end
end

local function refresh(list)
    local pending = 0
    local commits = {}

    local function finish()
        pending = pending - 1

        if pending == 0 then
            write_cache(commits)
        end
    end

    for _, entry in ipairs(list) do
        local dir = PLUGINS_DIR .. "/" .. entry.name

        if uv.fs_stat(dir .. "/.git") then
            pending = pending + 1

            vim.system({
                "git",
                "-C",
                dir,
                "rev-list",
                "-1",
                "--before=" .. MIN_AGE_DAYS .. " days ago",
                entry.ref,
            }, {}, function(result)
                local sha = result.code == 0 and result.stdout:match("%x+")

                if sha then
                    commits[entry.name] = sha
                end

                finish()
            end)
        end
    end
end

return function(specs)
    local list = {}

    collect(specs, list)

    local cache = read_cache()

    if cache then
        for _, entry in ipairs(list) do
            local sha = cache.commits[entry.name]

            if sha then
                entry.spec.commit = sha
            end
        end
    end

    if not cache or os.time() - (cache.checked_at or 0) >= CACHE_TTL_SECONDS then
        refresh(list)
    end

    return specs
end
