-- UI-related plugins
return {
	-- Colorschemes
	{
		"tiagovla/tokyodark.nvim",
		name = "tokyodark",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = { enable = true },
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Neotree",
							key = "f",
						},
						{
							desc = " LSP",
							group = "DiagnosticHint",
							action = "Mason",
							key = "a",
						},
						{
							desc = " Diagnostics",
							group = "Number",
							action = "checkhealth",
							key = "d",
						},
					},
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- Undo glow (action highlighting)
	{
		"y3owk1n/undo-glow.nvim",
		event = { "VeryLazy" },
		opts = {
			animation = {
				enabled = true,
				duration = 300,
				animation_type = "zoom",
				window_scoped = true,
			},
			highlights = {
				undo = { hl_color = { bg = "#693232" } },
				redo = { hl_color = { bg = "#2F4640" } },
				yank = { hl_color = { bg = "#7A683A" } },
				paste = { hl_color = { bg = "#325B5B" } },
				search = { hl_color = { bg = "#5C475C" } },
				comment = { hl_color = { bg = "#7A5A3D" } },
				cursor = { hl_color = { bg = "#793D54" } },
			},
			priority = 2048 * 3,
		},
		keys = {
			{
				"u",
				function()
					require("undo-glow").undo()
				end,
				mode = "n",
				desc = "Undo with highlight",
				noremap = true,
			},
			{
				"U",
				function()
					require("undo-glow").redo()
				end,
				mode = "n",
				desc = "Redo with highlight",
				noremap = true,
			},
			{
				"p",
				function()
					require("undo-glow").paste_below()
				end,
				mode = "n",
				desc = "Paste below with highlight",
				noremap = true,
			},
			{
				"P",
				function()
					require("undo-glow").paste_above()
				end,
				mode = "n",
				desc = "Paste above with highlight",
				noremap = true,
			},
			{
				"n",
				function()
					require("undo-glow").search_next({
						animation = { animation_type = "strobe" },
					})
				end,
				mode = "n",
				desc = "Search next with highlight",
				noremap = true,
			},
			{
				"N",
				function()
					require("undo-glow").search_prev({
						animation = { animation_type = "strobe" },
					})
				end,
				mode = "n",
				desc = "Search prev with highlight",
				noremap = true,
			},
			{
				"*",
				function()
					require("undo-glow").search_star({
						animation = { animation_type = "strobe" },
					})
				end,
				mode = "n",
				desc = "Search star with highlight",
				noremap = true,
			},
			{
				"#",
				function()
					require("undo-glow").search_hash({
						animation = { animation_type = "strobe" },
					})
				end,
				mode = "n",
				desc = "Search hash with highlight",
				noremap = true,
			},
			{
				"gc",
				function()
					local pos = vim.fn.getpos(".")
					vim.schedule(function()
						vim.fn.setpos(".", pos)
					end)
					return require("undo-glow").comment()
				end,
				mode = { "n", "x" },
				desc = "Toggle comment with highlight",
				expr = true,
				noremap = true,
			},
			{
				"gc",
				function()
					require("undo-glow").comment_textobject()
				end,
				mode = "o",
				desc = "Comment textobject with highlight",
				noremap = true,
			},
			{
				"gcc",
				function()
					return require("undo-glow").comment_line()
				end,
				mode = "n",
				desc = "Toggle comment line with highlight",
				expr = true,
				noremap = true,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				desc = "Highlight when yanking (copying) text",
				callback = function()
					require("undo-glow").yank()
				end,
			})

			vim.api.nvim_create_autocmd("CursorMoved", {
				desc = "Highlight when cursor moved significantly",
				callback = function()
					require("undo-glow").cursor_moved({
						animation = { animation_type = "slide" },
					})
				end,
			})

			vim.api.nvim_create_autocmd("FocusGained", {
				desc = "Highlight when focus gained",
				callback = function()
					local opts = {
						animation = { animation_type = "slide" },
					}
					opts = require("undo-glow.utils").merge_command_opts("UgCursor", opts)
					local pos = require("undo-glow.utils").get_current_cursor_row()
					require("undo-glow").highlight_region(vim.tbl_extend("force", opts, {
						s_row = pos.s_row,
						s_col = pos.s_col,
						e_row = pos.e_row,
						e_col = pos.e_col,
						force_edge = opts.force_edge == nil and true or opts.force_edge,
					}))
				end,
			})

			vim.api.nvim_create_autocmd("CmdlineLeave", {
				desc = "Highlight when search cmdline leave",
				callback = function()
					require("undo-glow").search_cmd({
						animation = { animation_type = "fade" },
					})
				end,
			})
		end,
	},
}
