return {
  -- Gruvbox
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = true,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = true,
        inverse = true,
        contrast = 'hard',
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },

  -- Onedark
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      local onedark = require('onedarkpro')

      onedark.setup({
        styles = {
          comments = 'italic',
          keywords = 'bold,italic',
          conditionals = 'italic',
          virtual_text = 'italic',
        },
        highlights = {
          Comment = { italic = true },
        },
        options = {
          lualine_transparency = true,
        },
      })
    end,
  },

  -- Sonokai
  {
    'sainnhe/sonokai',
    priority = 1000,
    config = true,
  },

  -- Everforest
  {
    'sainnhe/everforest',
    priority = 1000,
    config = true,
  },

  -- Palenight
  {
    'drewtempelmeyer/palenight.vim',
    priority = 1000,
  },

  -- Evergarden
  {
    'comfysage/evergarden',
    priority = 1000,
    opts = {
      transparent_background = false,
      contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
      style = {
        tabline = { reverse = true, color = 'green' },
        search = { reverse = false, inc_reverse = true },
        types = { italic = true },
        keyword = { italic = true },
        comment = { italic = true },
      },
    },
    config = function(_, opts)
      require('evergarden').setup(opts)
    end,
  },

  -- Solarized Osaka
  {
    'craftzdog/solarized-osaka.nvim',
    priority = 1000,
    config = function()
      local solarized = require('solarized-osaka')

      solarized.setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = 'dark',
          floats = 'dark',
        },
        sidebars = { 'qf', 'help' },
      })
    end,
  },
}
