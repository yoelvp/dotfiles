return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          border = 'rounded',
        },
      },
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function() require('yoelvp.lsp') end,
}
