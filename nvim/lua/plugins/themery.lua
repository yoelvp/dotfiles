return {
  'zaldih/themery.nvim',
  opts = {
    themesConfigFile = '~/dotfiles/nvim/lua/theme.lua',
    livePreview = true,
    themes = {
      {
        name = 'Everforest Hard',
        colorscheme = 'everforest',
        after = [[
          vim.cmd('let g:everforest_background = "hard"')
        ]],
      },
      {
        name = 'Everforest Medium',
        colorscheme = 'everforest',
        after = [[
          vim.cmd('let g:everforest_background = "medium"')
        ]],
      },
      {
        name = 'Everforest Soft',
        colorscheme = 'everforest',
        after = [[
          vim.cmd('let g:everforest_background = "soft"')
        ]],
      },
      {
        name = 'Gruvbox',
        colorscheme = 'gruvbox',
      },
      {
        name = 'Onedark Dark',
        colorscheme = 'onedark_dark',
      },
      {
        name = 'Onedark Vivid',
        colorscheme = 'onedark_vivid',
      },
      {
        name = 'Palenight',
        colorscheme = 'palenight',
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
