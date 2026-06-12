-- LSP-related plugins
return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
	-- Rust
	{
		"mrcjkb/rustaceanvim",
		config = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "<leader>rr", function()
							vim.cmd.RustLsp("runnables")
						end, { buffer = bufnr, desc = "Rust runnables" })
						vim.keymap.set("n", "<leader>rd", function()
							vim.cmd.RustLsp("debuggables")
						end, { buffer = bufnr, desc = "Rust debuggables" })
						vim.keymap.set("n", "K", function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end, { buffer = bufnr, desc = "Rust hover actions" })
					end,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
							completion = {
								postfix = {
									enable = true,
								},
							},
						},
					},
				},
			}
		end,
	},
	-- Rust crates
	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = { enabled = true },
					crates = { enabled = true, max_results = 8, min_chars = 5 },
				},
			})
		end,
	},
	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("config.cmp")
		end,
	},
}
