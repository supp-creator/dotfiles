-- LSP configuration for Neovim 0.11+
local mason_lspconfig = require("mason-lspconfig")

require("mason").setup()
mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "pyright",
    "ruff",
    "lua_ls",
    "rust_analyzer",
  },
})

if vim.lsp.config then
  -- C / C++
  vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp" },
    root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" },
  })
  vim.lsp.enable("clangd")

  -- Python
  vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  })
  vim.lsp.enable("pyright")

  vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  })
  vim.lsp.enable("ruff")

  -- Lua
  vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luacheckrc", ".git" },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  })
  vim.lsp.enable("lua_ls")
else
  local lspconfig = require("lspconfig")

  lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index" },
  })

  lspconfig.pyright.setup({})

  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  })

  lspconfig.ruff.setup({})
end
