return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'windwp/nvim-autopairs',
    {
      'roobert/tailwindcss-colorizer-cmp.nvim',
      config = true
    },
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
      dependencies = 'rafamadriz/friendly-snippets'
    }
  },
  opts = function (_, opts)
    opts.formatting = {
      format = require('tailwindcss-colorizer-cmp').formatter
    }
  end,
  config = function()
    require('yoelvp.cmp')
    -- require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({ paths = { '/home/yoelvp/dotfiles/nvim/snippets' } })
  end,
}
