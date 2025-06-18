return {
  'zaldih/themery.nvim',
  opts = {
    themesConfigFile = '~/dotfiles/nvim/lua/theme.lua',
    livePreview = true,
    themes = {
      {
        name = 'Everforest',
        colorscheme = 'everforest',
      },
      {
        name = 'Gruvbox',
        colorscheme = 'gruvbox',
      },
      {
        name = 'Nightforest',
        colorscheme = 'nightforest'
      }
    },
  },
  config = function(_, opts)
    local themery = require('themery')

    themery.setup(opts)
  end,
}
