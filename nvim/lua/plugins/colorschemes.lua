return {
  -- Gruvbox material
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_bold = 1
      vim.g.gruvbox_italic = 1
      vim.gjgruvbox_underline = 1
      vim.g.gruvbox_undercurl = 1
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_italicize_comments = 1
      vim.g.gruvbox_invert_selection = 1
    end
  },

  -- Everforest
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard' -- hard | medium | soft
      vim.g.everforest_better_performance = 1
    end
  },

  -- Nightforest
  {
    'xfyuan/nightforest.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightforest').setup({
        midnight = false
      })
    end
  },
}
