return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup({
      '*',
      html = { names = true },
    })
  end,
}
