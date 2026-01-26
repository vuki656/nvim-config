local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet

return create_snippet(
    "router",
    format(
        [[
        const router = useRouter()
    ]],
        {}
    )
)
