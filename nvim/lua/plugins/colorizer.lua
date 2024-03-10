return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    local colorizer = require('colorizer')

    colorizer.setup({
      '*',
      'markdown',
      'yaml',
      css = { rgb_fn = true, names = true },
      yaml = { rgb_fn = true },
      html = { names = true }
    }, {
      mode = 'background'
    })
  end
}
