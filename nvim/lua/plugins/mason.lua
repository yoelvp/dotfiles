require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'sumneko_lua', 'rust_analyzer', 'bashls', 'cssls', 'eslint', 'html', 'jsonls', 'quick_lint_js', 'tsserver', 'pyright', 'rescriptls' },
    automatic_installation = true
}

