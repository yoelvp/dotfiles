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
        ['*.astro'] = {
          icon = '',
          color = '#E1387C',
          name = 'Astro'
        }
      },
    })
  end,
}
