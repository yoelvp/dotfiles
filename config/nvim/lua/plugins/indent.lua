return {
  'echasnovski/mini.nvim',
  version = '*',
  event = "VeryLazy",
  opts = function(_, opts)
    opts.scroll = {
      enable = false,
    }
  end,
  config = function()
    require('mini.indentscope').setup({
      symbol = ''
    })
    require('mini.animate').setup()
  end
}
