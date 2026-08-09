local REPO = "mason-org/mason-registry"
local MIN_AGE_DAYS = 3
local CACHE_TTL_SECONDS = 24 * 60 * 60
local CACHE_FILE = vim.fn.stdpath("cache") .. "/mason-registry-pin.json"

local function read_cache()
    local file = io.open(CACHE_FILE, "r")

    if not file then
        return nil
    end

    local content = file:read("*a")

    file:close()

    local ok, cache = pcall(vim.json.decode, content)

    if ok and type(cache) == "table" and cache.tag then
        return cache
    end

    return nil
end

local function write_cache(tag)
    local file = io.open(CACHE_FILE, "w")

    if not file then
        return
    end

    file:write(vim.json.encode({ tag = tag, checked_at = os.time() }))
    file:close()
end

local function pick_tag(releases)
    local cutoff = os.date("!%Y-%m-%d", os.time() - MIN_AGE_DAYS * 24 * 60 * 60)

    for _, release in ipairs(releases) do
        local date = type(release.tag_name) == "string" and release.tag_name:match("^%d%d%d%d%-%d%d%-%d%d")

        if date and date <= cutoff then
            return release.tag_name
        end
    end

    local oldest = releases[#releases]

    return oldest and oldest.tag_name or nil
end

local function fetch_tag(on_done)
    vim.system({
        "curl",
        "--silent",
        "--fail",
        "--max-time",
        "5",
        "https://api.github.com/repos/" .. REPO .. "/releases?per_page=100",
    }, {}, function(result)
        if result.code ~= 0 then
            on_done(nil)

            return
        end

        local ok, releases = pcall(vim.json.decode, result.stdout)

        on_done(ok and pick_tag(releases) or nil)
    end)
end

return function()
    local cache = read_cache()

    if cache and os.time() - (cache.checked_at or 0) < CACHE_TTL_SECONDS then
        return "github:" .. REPO .. "@" .. cache.tag
    end

    if cache then
        fetch_tag(function(tag)
            if tag then
                write_cache(tag)
            end
        end)

        return "github:" .. REPO .. "@" .. cache.tag
    end

    local done = false
    local tag = nil

    fetch_tag(function(result)
        tag = result
        done = true
    end)

    vim.wait(6000, function()
        return done
    end)

    if tag then
        write_cache(tag)

        return "github:" .. REPO .. "@" .. tag
    end

    return "github:" .. REPO
end
