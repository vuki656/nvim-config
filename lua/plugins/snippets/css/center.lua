local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet

return create_snippet(
    "csc",
    format(
        [[
display: flex;
align-items: center;
justify-content: center;
    ]],
        {}
    )
)
