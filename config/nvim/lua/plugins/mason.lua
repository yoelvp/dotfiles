return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lsp = require('mason-lspconfig')

    -- Mason config
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    -- Mason Lspconfig
    mason_lsp.setup({
      ensure_installed = {
        'rust_analyzer',
        'bashls',
        'cssls',
        'html',
        'jsonls',
        'tsserver',
        'lua_ls',
        'astro',
        'tailwindcss',
        'svelte',
        'intelephense'
      },
      automatic_installation = true
    })
  end,
}
