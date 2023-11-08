return {
  'hrsh7th/nvim-cmp',
  event = 'VeryLazy',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
      dependencies = 'rafamadriz/friendly-snippets'
    }
  },
  config = function()
    require('yoelvp.cmp')
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
