return {
  -- Gruvbox
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_contrast_dark = 'hard' -- soft | medium | hard
      vim.g.gruvbox_bold = true
      vim.g.gruvbox_italic = true
      vim.g.gruvbox_transparent_bg = true
      vim.g.gruvbox_invert_selection = false
      vim.g.gruvbox_sign_column = 'bg0'

      vim.cmd('colorscheme gruvbox')
    end
  },

  -- Everforest
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 0,
    enabled = false,
    config = function()
      vim.g.everforest_background = 'hard' -- hard | medium | soft
      vim.g.everforest_better_performance = 1
    end
  },
}
