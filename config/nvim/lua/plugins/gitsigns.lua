return {
  'lewis6991/gitsigns.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      signcolumn = true,
      numhl = true,
      trouble = false,
      max_file_length = 10000
    })
  end
}
