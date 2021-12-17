local lsp_config = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

local extension = ".{yml,yaml}"

lsp_config.yamlls.setup({
    capabilities = capabilities,
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
})
