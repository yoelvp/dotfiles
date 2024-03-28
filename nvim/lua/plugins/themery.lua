return {
  'zaldih/themery.nvim',
  config = function ()
    local themery = require('themery')

    themery.setup({
      themeConfigFile = '~/.config/nvim/lua/config/theme.lua',
      livePreview = true,
      themes = {
        {
          name = 'Gruvbox',
          colorscheme = 'gruvbox'
        },
        {
          name = 'Onedark Vivid',
          colorscheme = 'onedark_vivid'
        },
        {
          name = 'Onedark Dark',
          colorscheme = 'onedark_dark'
        },
        {
          name = 'Sonokai Atlantis',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "atlantis"')
          ]]
        },
        {
          name = 'Sonokai Andromeda',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "andromeda"')
          ]]
        },
        {
          name = 'Sonokai Shushia',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "shusia"')
          ]]
        },
        {
          name = 'Sonokai Maia',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "maia"')
          ]]
        },
        {
          name = 'Sonokai Espresso',
          colorscheme = 'sonokai',
          after = [[
            vim.cmd('let g:sonokai_style = "espresso"')
          ]]
        },
        {
          name = 'Everforest Soft',
          colorscheme = 'everforest',
          after = [[
            vim.cmd('let g:everforest_background = "soft"')
          ]]
        },
        {
          name = 'Everforest Medium',
          colorscheme = 'everforest',
          after = [[
            vim.cmd('let g:everforest_background = "medium"')
          ]]
        },
        {
          name = 'Everforest Hard',
          colorscheme = 'everforest',
          after = [[
            vim.cmd('let g:everforest_background = "hard"')
          ]]
        },
        {
          name = 'Evergarden',
          colorscheme = 'evergarden'
        },
        {
          name = 'Solarized Osaka',
          colorscheme = 'solarized-osaka'
        }
      }
    })
  end
}
