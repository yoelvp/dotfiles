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

  -- Gruvbox baby
  {
    'luisiacc/gruvbox-baby',
    branch = 'main'
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
}
