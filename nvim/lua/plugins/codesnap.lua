return {
  'mistricky/codesnap.nvim',
  build = 'make',
  version = '^1',
  opts = {
    mac_window_bar = true,
    title = 'CodeSnap.nvim',
    watermark = 'yoelvp',
    code_font_family = 'CaskaydiaMono Nerd Font',
    bg_theme = 'peach',
    save_path = '~/Desktop/Screenshots/Code',
  },
  config = function(_, opts)
    require('codesnap').setup(opts)
  end,
}
