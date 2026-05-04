-- LSP configuration for Neovim 0.11+
local mason_lspconfig = require("mason-lspconfig")

-- Mason setup
require("mason").setup()
mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"pylsp",
		"lua_ls",
		"bsl_ls",
	},
})

-- Use new Neovim 0.11+ LSP API if available, otherwise fall back to lspconfig
if vim.lsp.config then
	-- Neovim 0.11+ native LSP configuration
	vim.lsp.config("clangd", {
		cmd = { "clangd", "--background-index" },
	})
	vim.lsp.enable("clangd")

	vim.lsp.config("pylsp", {
		cmd = { "pylsp", "--background-index" },
	})
	vim.lsp.enable("pylsp")

	vim.lsp.config("lua_ls", {
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

	vim.lsp.config("bsl_ls", {})
	vim.lsp.enable("bsl_ls")

	vim.lsp.config("clojure-lsp", {})
	vim.lsp.enable("clojure-lsp")
else
	-- Fallback for older Neovim versions
	local lspconfig = require("lspconfig")

	lspconfig.clangd.setup({
		cmd = { "clangd", "--background-index" },
	})

	lspconfig.pylsp.setup({
		cmd = { "pylsp", "--background-index" },
	})

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
end
