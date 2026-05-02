vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ttyfast = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

vim.cmd.colorscheme("vim")
vim.g.mapleader = " "


-- Lazy.nvim 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end 
vim.opt.rtp:prepend(lazypath)

--Plugins
require("lazy").setup({
	-- LSP & Mason
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
    {
        "tiagovla/tokyodark.nvim",
        name = 'tokyodark',
        priority = 1000,
        -- config = function()
            -- vim.cmd.colorscheme("tokyodark")
        -- end,
    },
    {
        "saecki/crates.nvim",
        tag = 'stable',
        event = { "bufread Cargo.toml"},
        config = function()
            require('crates').setup()
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            background_color = "#000000"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({})
        end,
    },
    {
        'NeogitOrg/neogit', 
        lazy = true, 
        cmd = "Neogit", 
        keys = {
            "<leader>gg",
            "<cmd>Neogit<cr>",
            desc = "Show Neogit UI" 
        }
    },
    {
        "mrcjkb/rustaceanvim"
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = fasle,
        build = ':TSUpdate'
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- priority = 1000,
        -- config = function()
            -- vim.cmd.colorscheme("catpuccin-macchiato")
        -- end,
    },
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-neo-tree/neo-tree.nvim"
    },
    {
        "nvimdev/dashboard-nvim",
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                week_header = { enable = true, },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Neotree',
          key = 'f',
        },
        {
          desc = ' LSP',
          group = 'DiagnosticHint',
          action = 'Mason',
          key = 'a',
        },
        {
          desc = ' Diagnostics',
          group = 'Number',
          action = 'checkhealth',
          key = 'd',
        },
      },
    },
  }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'} }
    },
	{
		"neovim/nvim-lspconfig", 
	},
    {
        "norcalli/nvim-colorizer.lua"
    },
	--Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
    --Action Highlighting
    {
        "y3owk1n/undo-glow.nvim",
        event = { "VeryLazy" },
  ---@type UndoGlow.Config
        opts = {
        animation = {
            enabled = true,
            duration = 300,
            animation_type = "zoom",
            window_scoped = true,
            },
        highlights = {
            undo = {
                hl_color = { bg = "#693232" }, -- Dark muted red
                },
            redo = {
                hl_color = { bg = "#2F4640" }, -- Dark muted green
                },
            yank = {
                hl_color = { bg = "#7A683A" }, -- Dark muted yellow
                },
            paste = {
                hl_color = { bg = "#325B5B" }, -- Dark muted cyan
                },
            search = {
                hl_color = { bg = "#5C475C" }, -- Dark muted purple
                },
            comment = {
                hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
                },
            cursor = {
                hl_color = { bg = "#793D54" }, -- Dark muted pink
                },
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
                    animation = {
                        animation_type = "strobe",
                    },
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
                    animation = {
                        animation_type = "strobe",
                    },
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
                    animation = {
                        animation_type = "strobe",
                    },
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
                    animation = {
                        animation_type = "strobe",
                    },
                })
            end,
            mode = "n",
            desc = "Search hash with highlight",
            noremap = true,
        },
        {
      "gc",
      function()
        -- This is an implementation to preserve the cursor position
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

    -- This only handles neovim instance and do not highlight when switching panes in tmux
    vim.api.nvim_create_autocmd("CursorMoved", {
      desc = "Highlight when cursor moved significantly",
      callback = function()
        require("undo-glow").cursor_moved({
          animation = {
            animation_type = "slide",
          },
        })
      end,
    })

    -- This will handle highlights when focus gained, including switching panes in tmux
    vim.api.nvim_create_autocmd("FocusGained", {
      desc = "Highlight when focus gained",
      callback = function()
        ---@type UndoGlow.CommandOpts
        local opts = {
          animation = {
            animation_type = "slide",
          },
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
          animation = {
            animation_type = "fade",
          },
        })
      end,
    })
  end,
},
    })

--colorizer
require'colorizer'.setup()







--file tree
require("neo-tree").setup().setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = true,
    ensure_installed = { 'lua', 'c', 'cpp', 'rust', 'python', 'bash', 'vim' },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    }

})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

-- Mason & LSP setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 
        "clangd",
        "pylsp",
        "lua_ls",
        "bsl_ls",
        "clojure-lsp",
    },
})

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index" },
})

lspconfig.pylsp.setup({
    cmd = { "pylsp", "--background-index"},
})

--for _, server in ipairs(servers) do
--    lspconfig(server).setup({})
--end

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

--Rust crates auto
require('crates').setup({
    completion = {
        cmp = { enabled = true },
        crates = { enabled = true, max_results = 8, min_chars = 5 },
    }
})

--LSP Keybinds

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})


