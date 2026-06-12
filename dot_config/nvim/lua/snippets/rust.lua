local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return ls.add_snippets("rust", {
  s("fn", {
    t("fn "),
    i(1, "name"),
    t("("),
    i(2),
    t(")"),
    i(4, " -> "),
    t({ " {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("main", {
    t("fn main() {"),
    t({ "", "\t" }),
    i(1),
    t({ "", "}" }),
  }),

  s("let", {
    t("let "),
    i(1, "mut name"),
    t(" = "),
    i(2, "value"),
    t(";"),
  }),

  s("match", {
    t("match "),
    i(1, "expr"),
    t(" {"),
    t({ "", "\t" }),
    i(2, "Pattern"),
    t(" => "),
    i(3, "result"),
    t(","),
    t({ "", "\t_ => " }),
    i(4, "todo!()"),
    t({ "", "}" }),
  }),

  s("impl", {
    t("impl "),
    i(1, "Type"),
    t(" {"),
    t({ "", "\t" }),
    i(2),
    t({ "", "}" }),
  }),

  s("struct", {
    t("struct "),
    i(1, "Name"),
    t(" {"),
    t({ "", "\t" }),
    i(2),
    t({ "", "}" }),
  }),

  s("enum", {
    t("enum "),
    i(1, "Name"),
    t(" {"),
    t({ "", "\t" }),
    i(2),
    t({ "", "}" }),
  }),

  s("for", {
    t("for "),
    i(1, "item"),
    t(" in "),
    i(2, "iterable"),
    t(" {"),
    t({ "", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("iflet", {
    t("if let "),
    i(1, "Pattern"),
    t(" = "),
    i(2, "expr"),
    t(" {"),
    t({ "", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("whilelet", {
    t("while let "),
    i(1, "Pattern"),
    t(" = "),
    i(2, "expr"),
    t(" {"),
    t({ "", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("derive", {
    t("#[derive("),
    i(1, "Debug, Clone"),
    t(")]"),
  }),

  s("println", {
    t("println!(\""),
    i(1, "{}"),
    t("\""),
    i(2, ", "),
    t(");"),
  }),

  s("vec", {
    t("vec!["),
    i(1),
    t("]"),
  }),

  s("mod", {
    t("mod "),
    i(1, "name"),
    t(";"),
  }),

  s("use", {
    t("use "),
    i(1, "crate::module"),
    t("::"),
    i(2, "Item"),
    t(";"),
  }),
})
