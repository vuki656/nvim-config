-- Name: Dev Icons
-- Description: Custom file icons
-- Link: https://github.com/kyazdani42/nvim-web-devicons

local icons = require("nvim-web-devicons")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

icons.setup({
    override = {
        ["yarn.lock"] = {
            icon = "",
            color = "#cc3534",
            name = "YarnLock",
        },
        ["package.json"] = {
            icon = "",
            color = "#cc3534",
            name = "PackageJson",
        },
        [".npmrc"] = {
            icon = "",
            color = "#cc3534",
            name = "PackageJson",
        },
        [".env"] = {
            icon = "﬛",
            color = "#e79627",
            name = "Env",
        },
        [".env.example"] = {
            icon = "﬛",
            color = "#e79627",
            name = "EnvExample",
        },
        [".env.local"] = {
            icon = "﬛",
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
        [".eslintrc.json"] = {
            icon = "難",
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
        ["Dockerfile"] = {
            icon = "",
            color = "#1e9cef",
            name = "Docker",
        },
        [".dockerignore"] = {
            icon = "",
            color = "#1e9cef",
            name = "Docker",
        },
        [".yml"] = {
            icon = "",
            color = "#ffca28",
            name = "Yml",
        },
        [".yaml"] = {
            icon = "",
            color = "#ffca28",
            name = "Yaml",
        },
        ["schema.graphql"] = {
            icon = "爵",
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
