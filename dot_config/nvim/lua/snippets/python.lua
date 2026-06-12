local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return ls.add_snippets("python", {
  s("def", {
    t("def "),
    i(1, "name"),
    t("("),
    i(2, "args"),
    t("):", "\t"),
    i(3),
  }),

  s("class", {
    t("class "),
    i(1, "Name"),
    t(":"),
    t({ "", "\tdef __init__(self" }),
    i(2, ", ..."),
    t("):", "\t\t"),
    i(3),
  }),

  s("for", {
    t("for "),
    i(1, "item"),
    t(" in "),
    i(2, "iterable"),
    t(":"),
    t({ "", "\t" }),
    i(3),
  }),

  s("main", {
    t("if __name__ == \"__main__\":"),
    t({ "", "\t" }),
    i(1),
  }),

  s("if", {
    t("if "),
    i(1, "cond"),
    t(":"),
    t({ "", "\t" }),
    i(2),
  }),

  s("elif", {
    t("elif "),
    i(1, "cond"),
    t(":"),
    t({ "", "\t" }),
    i(2),
  }),

  s("else", {
    t("else:"),
    t({ "", "\t" }),
    i(1),
  }),

  s("imp", {
    t("import "),
    i(1, "module"),
  }),

  s("from", {
    t("from "),
    i(1, "module"),
    t(" import "),
    i(2, "name"),
  }),

  s("print", {
    t("print("),
    i(1),
    t(")"),
  }),

  s("async", {
    t("async def "),
    i(1, "name"),
    t("("),
    i(2, "args"),
    t("):", "\t"),
    i(3),
  }),

  s("with", {
    t("with "),
    i(1, "expr"),
    t(" as "),
    i(2, "alias"),
    t(":"),
    t({ "", "\t" }),
    i(3),
  }),

  s("try", {
    t("try:"),
    t({ "", "\t" }),
    i(1),
    t({ "", "except " }),
    i(2, "Exception"),
    t(" as "),
    i(3, "e"),
    t(":"),
    t({ "", "\t" }),
    i(4),
  }),

  s("lam", {
    t("lambda "),
    i(1, "x"),
    t(": "),
    i(2, "x + 1"),
  }),
})
