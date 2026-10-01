-- Neovim Configuration Entry Point

-- Load core options
require("config.options")

require("config.lazy")

-- Setup plugins
require("lazy").setup({
	{ import = "plugins" },
})

-- Setup LSP
require("lsp.config")
require("lsp.keymaps")

pcall(vim.cmd.colorscheme, "catppuccin")
