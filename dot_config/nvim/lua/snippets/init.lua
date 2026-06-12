local ls = require("luasnip")

ls.filetype_extend("c", { "c" })
ls.filetype_extend("cpp", { "c" })

require("snippets.c")
require("snippets.python")
require("snippets.rust")
