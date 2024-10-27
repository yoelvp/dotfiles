return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  version = '^1',
  keys = {
    { '<leader>cs', ':CodeSnap<CR>', mode = 'x', desc = 'Save screenshot to clipboard' },
    { '<leader>cS', ':CodeSnapSave<CR>', mode = 'x', desc = 'Save the code capture locally' }
  },
  opts = {
    mac_window_bar = true,
    title = 'CodeSnap.nvim',
    watermark = 'yoelvp',
    code_font_family = 'CaskaydiaMono Nerd Font',
    bg_theme = 'dusk',
    bg_padding = 16,
    save_path = '~/Desktop/Screenshots/Code',
  },
  config = function(_, opts)
    require('codesnap').setup(opts)
  end,
}
