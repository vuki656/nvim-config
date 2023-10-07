local luasnip = require("luasnip")

local create_snippet = luasnip.snippet
local text_node = luasnip.text_node

return create_snippet("cls", text_node("console.log('==================================')"))
