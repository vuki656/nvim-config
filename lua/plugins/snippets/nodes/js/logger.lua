local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "lgg",
    format("logger.info({})", {
        insert_node(1),
    })
)
