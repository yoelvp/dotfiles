return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim'
  },
  main = 'yoelvp.lspconfig',
  opts = {
    mason = {
      enable = true,
      auto_install = true
    }
  }
  -- config = function() require('yoelvp.lsp') end
}
