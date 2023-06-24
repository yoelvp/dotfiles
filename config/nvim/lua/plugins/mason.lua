return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim'
  },
  config = function()
    local mason_ok, mason = pcall(require, 'mason')
    local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

    if not mason_ok then
      return
    end
    if not mason_lsp_ok then
      return
    end

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
        'emmet_ls',
        'html',
        'jsonls',
        'tsserver',
        'lua_ls',
        'rescriptls',
        'tailwindcss',
      },
      automatic_installation = true,
    })
  end
}

