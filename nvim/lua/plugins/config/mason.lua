require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'rust_analyzer',
    'bashls',
    'cssls',
    'tailwindcss',
    'html',
    'jsonls',
    'tsserver',
    'pyright',
    'rescriptls'
  },
  automatic_installation = true
})
-- vim.cmd [[
--   let g:mason#languages = { 'javascript': { 'server': 'javascript-typescript-stdio' } }
--   let g:treesitter_javascript_enabled = 1
-- ]]
