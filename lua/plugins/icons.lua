-- Name: Dev Icons
-- Description: Custom file icons
-- Link: https://github.com/nvim-tree/nvim-web-devicons

local colors = require("utils.colors")
local icons = require("nvim-web-devicons")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

icons.setup({
    override = {
        ["proto"] = {
            icon = "󰿘",
            color = colors.yellow,
            name = "Proto",
        },
        [".bashrc"] = {
            icon = "",
            color = "#a5afbe",
            name = "Bashrc",
        },
        [".bash_profile"] = {
            icon = "",
            color = "#a5afbe",
            name = "BashProfile",
        },
        [".bash_functions"] = {
            icon = "",
            color = "#a5afbe",
            name = "BashFunctions",
        },
        [".bash_aliases"] = {
            icon = "",
            color = "#a5afbe",
            name = "BashAliases",
        },
        [".npmrc"] = {
            icon = "",
            color = "#cc3534",
            name = "PackageJson",
        },
        [".env"] = {
            icon = "",
            color = "#e79627",
            name = "Env",
        },
        [".env.example"] = {
            icon = "",
            color = "#e79627",
            name = "EnvExample",
        },
        [".env.local"] = {
            icon = "",
            color = "#e79627",
            name = "EnvLocal",
        },
        [".env.ci"] = {
            icon = "",
            color = "#e79627",
            name = "EnvLocal",
        },
        ["test.unit.ts"] = {
            icon = "",
            color = "#e79627",
            cterm_color = "74",
            name = "TestTs",
        },
        ["test.integration.ts"] = {
            icon = "",
            color = "#e79627",
            cterm_color = "74",
            name = "TestTs",
        },
        [".env.test"] = {
            icon = "",
            color = "#e79627",
            name = "EnvLocal",
        },
        [".babelrc"] = {
            icon = "",
            color = "#e79627",
            name = "EnvLocal",
        },
        ["js"] = {
            icon = "",
            color = "#ffcb6b",
            name = "Js",
        },
        ["ts"] = {
            icon = "ﯤ",
            color = "#497eb9",
            name = "Ts",
        },
        ["jsx"] = {
            icon = "",
            color = "#61d9fa",
            name = "Jsx",
        },
        ["tsx"] = {
            icon = "",
            color = "#61d9fa",
            name = "Tsx",
        },
        ["index.ts"] = {
            icon = "",
            color = "#a5afbe",
            name = "IndexTs",
        },
        [".eslintrc.js"] = {
            icon = "󰱺",
            color = "#7963e6",
            name = "EslintRc",
        },
        [".eslintrc.json"] = {
            icon = "󰱺",
            color = "#7963e6",
            name = "EslintRc",
        },
        [".gitignore"] = {
            icon = "",
            color = "#e94e31",
            name = "GitIgnore",
        },
        [".gitattributes"] = {
            icon = "",
            color = "#e94e31",
            name = "GitIgnore",
        },
        ["lua"] = {
            icon = "",
            color = "#9575cd",
            name = "Lua",
        },
        [".luacheckrc"] = {
            icon = "",
            color = "#9575cd",
            name = "Lua",
        },
        ["graphql"] = {
            icon = "󰡷",
            color = "#7963e6",
            name = "Graphql",
        },
        ["gql"] = {
            icon = "󰡷",
            color = "#7963e6",
            name = "Graphql",
        },
        ["bitbucket-pipelines.yml"] = {
            icon = "",
            color = "#267ff6",
            name = "BitbucketPipeline",
        },
        [".nvmrc"] = {
            icon = "",
            color = "#72b823",
            name = "Nvmrc",
        },
    },
})
