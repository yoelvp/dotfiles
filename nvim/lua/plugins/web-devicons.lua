return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    local icons = require('nvim-web-devicons')
    local eslint_format = {
      icon = '󰱺',
      color = '#4B32C3',
      name = 'Eslint',
    }

    icons.setup({
      color_icons = true,
      strict = true,
      override_by_filename = {
        ['.eslintrc.json'] = eslint_format,
        ['.eslintignore'] = eslint_format,
        ['.eslintrc.mjs'] = eslint_format,
        -- ['app'] = {
        --   icon = '󱋣',
        --   color = '#FF8080',
        --   name = 'App folder name'
        -- },
        -- ['node_modules'] = {
        --   icon = '',
        --   color = '#012100',
        --   name = 'node_modules folder name'
        -- },
        -- ['layouts'] = {
        --   icon = '󰲂',
        --   color = '#6096B4',
        --   name = 'layouts folder name'
        -- },
        -- ['public'] = {
        --   icon = '󱞊',
        --   color = '#6096B4',
        --   name = 'public folder name'
        -- },
        -- ['images'] = {
        --   icon = '󰉏',
        --   color = '#6096B4',
        --   name = 'images folder name'
        -- },
      },
    })
  end,
}
