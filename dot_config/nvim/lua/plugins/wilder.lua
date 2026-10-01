
return {
  "gelguy/wilder.nvim",
  -- Load wilder when entering the command line or starting a search
  keys = { ":", "/", "?" },
  dependencies = {
    "romgrk/fzy-lua-native", -- Optional: Makes fuzzy matching much faster
  },
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    -- Configure the search pipeline (Fuzzy matching)
    wilder.set_option(
      "pipeline",
      {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1, -- Enables fuzzy matching
            set_registers = 1,
          }),
          wilder.search_pipeline()
        ),
      }
    )

    -- Configure the visual renderer (Floating Popup Menu)
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = {
            border = "Normal", -- Uses your theme's default border color
          },
          border = "double",  -- Options: 'single', 'double', 'rounded', 'solid'
          left = { " ", wilder.popupmenu_devicons() }, -- Shows file icons if nvim-web-devicons is installed
          right = { " ", wilder.popupmenu_scrollbar() },
        })
      )
    )
  end,
}
