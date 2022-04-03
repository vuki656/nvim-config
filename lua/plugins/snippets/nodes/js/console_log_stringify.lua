local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt
local repeat_node = require("luasnip.extras").rep

local create_snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return create_snippet(
    "clgs",
    format("console.log('{}', JSON.stringify({}, null, '   '))", { repeat_node(1), insert_node(1) })
)
