return {
  'zaldih/themery.nvim',
  config = function()
    local themery = require('themery')

    themery.setup({
      themeConfigFile = '~/.config/nvim/lua/config/theme.lua',
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
          name = 'Evergarden',
          colorscheme = 'evergarden',
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
        {
          name = 'Sonokai Andromeda',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "andromeda"')
          ]],
        },
        {
          name = 'Sonokai Atlantis',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "atlantis"')
          ]],
        },
        {
          name = 'Sonokai Espresso',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "espresso"')
          ]],
        },
        {
          name = 'Sonokai Maia',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "maia"')
          ]],
        },
        {
          name = 'Sonokai Shushia',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "shusia"')
          ]],
        },
      },
    })
  end,
}
