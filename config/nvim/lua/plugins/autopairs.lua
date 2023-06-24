return {
  'windwp/nvim-autopairs',
  lazy = true,
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt', 'vim' },
    })
  end
}
