local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return ls.add_snippets("c", {
  s("main", {
    t({ "int main(int argc, char *argv[]) {", "\t" }),
    i(1),
    t({ "", "\treturn 0;", "}" }),
  }),

  s("for", {
    t("for ("),
    i(1, "int i = 0"),
    t("; "),
    i(2, "i < n"),
    t("; "),
    i(3, "i++"),
    t(") {", "\t"),
    i(4),
    t({ "", "}" }),
  }),

  s("while", {
    t("while ("),
    i(1, "cond"),
    t(") {", "\t"),
    i(2),
    t({ "", "}" }),
  }),

  s("if", {
    t("if ("),
    i(1, "cond"),
    t(") {", "\t"),
    i(2),
    t({ "", "}" }),
  }),

  s("else", {
    t("else {", "\t"),
    i(1),
    t({ "", "}" }),
  }),

  s("elif", {
    t("else if ("),
    i(1, "cond"),
    t(") {", "\t"),
    i(2),
    t({ "", "}" }),
  }),

  s("struct", {
    t("typedef struct "),
    i(1, "name"),
    t(" {", "\t"),
    i(2),
    t({ "", "} " }),
    f(function(args) return args[1][1] end, { 1 }),
    t(";"),
  }),

  s("printf", {
    t("printf(\""),
    i(1, "%s\\n"),
    t("\""),
    i(2, ", "),
    t(");"),
  }),

  s("include", {
    t("#include <"),
    i(1, "stdio"),
    t(".h>"),
  }),

  s("inc", {
    t("#include \""),
    i(1, "header"),
    t(".h\""),
  }),

  s("forr", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    f(function(args) return args[1][1] end, { 1 }),
    t(" < "),
    i(2, "n"),
    t("; "),
    f(function(args) return args[1][1] end, { 1 }),
    t("++) {", "\t"),
    i(3),
    t({ "", "}" }),
  }),
})
