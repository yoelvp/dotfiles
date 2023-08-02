return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local ok, mason = pcall(require, 'mason')
    local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

    if not ok then
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
        'html',
        'jsonls',
        'tsserver',
        'lua_ls',
        'rescriptls',
        'tailwindcss',
        -- 'pyright',
        'svelte'
      },
      automatic_installation = true
    })
  end,
}
