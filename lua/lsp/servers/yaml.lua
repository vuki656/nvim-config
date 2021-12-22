local SERVERS = require("lsp.utils.servers")

local extension = ".{yml,yaml}"

return function(default_options, server_name)
    if server_name ~= SERVERS.YAML then
        return default_options
    end

    local options = {
        schemas = {
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                "docker-compose*." .. extension,
            },
            ["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*." .. extension,
            ["http://json.schemastore.org/github-action.json"] = ".github/action." .. extension,
            ["https://bitbucket.org/atlassianlabs/atlascode/raw/main/resources/schemas/pipelines-schema.json"] = "bitbucket-pipelines."
                .. extension,
            ["https://yarnpkg.com/configuration/yarnrc.json"] = ".yarnrc." .. extension,
        },
    }

    return vim.tbl_deep_extend("force", {}, default_options, options)
end
