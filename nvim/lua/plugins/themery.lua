return {
  'zaldih/themery.nvim',
  opts = {
    themesConfigFile = '~/dotfiles/nvim/lua/theme.lua',
    livePreview = true,
    themes = {
      {
        name = 'Gruvbox Material',
        colorscheme = 'gruvbox-material',
      },
      {
        name = 'Solarized Osaka',
        colorscheme = 'solarized-osaka',
      },
    },
  },
  config = function(_, opts)
    local themery = require('themery')

    themery.setup(opts)
  end,
}
