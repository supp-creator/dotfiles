-- Tools and utilities
return {
	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	},
	-- Git integration
	{
		"NeogitOrg/neogit",
		lazy = true,
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "VeryLazy" },
		config = function()
			require("nvim-treesitter").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				ensure_installed = { "lua", "c", "cpp", "rust", "python", "bash", "vim" },
			})
		end,
	},
	-- UI dependencies
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-lua/plenary.nvim",
	},
}
