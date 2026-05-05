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
	-- yazi plugin
    {
        "mikavilpas/yazi.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim", lazy = true },
        keys = {
            {
                "<leader>-",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file.",
            },
            {
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in working directory.",
            },
            {
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume last yazi session.",
            },
        },
        opts = {
            open_for_directories = true,
            keymaps = {
                show_help = "<f1>",
            },
        },
        init = function()
            vim.g.loaded_netrwPlugin = 1
        end,
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

