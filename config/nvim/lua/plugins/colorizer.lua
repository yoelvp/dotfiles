return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup({
      '*',
      'markdown',
      css = { rgb_fn = true, names = true },
      html = { names = true }
    }, {
      mode = 'background'
    })
  end
}
