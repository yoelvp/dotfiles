return {
  'ellisonleao/gruvbox.nvim',
  enabled = true,
  lazy = false,
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
        folds = true
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
      transparent_mode = false
    })

    vim.cmd([[
      colorscheme gruvbox
      let g:airline_theme='gruvbox'
    ]])
  end
}