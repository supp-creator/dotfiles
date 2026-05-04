-- Neovim Configuration Entry Point

-- Load core options
require("config.options")

-- Load keymaps
require("config.keymaps")

-- Load autocmds
require("config.autocmds")

-- Bootstrap and setup lazy.nvim
require("config.lazy")

-- Setup plugins
require("lazy").setup({
	{ import = "plugins" },
})

-- Setup LSP
require("lsp.config")
require("lsp.keymaps")

-- Set colorscheme (fallback to default if tokyodark fails)
pcall(vim.cmd.colorscheme, "tokyodark")
