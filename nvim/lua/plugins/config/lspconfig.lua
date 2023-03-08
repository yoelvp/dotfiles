local lsp = require('lspconfig')
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', bufopts)
  vim.keymap.set('n', '<leader>ds', ':Telescope lsp_document_symbols<CR>', bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Format auto save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end
  })
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      }
    }
  },
  on_attach = on_attach,
  flags = lsp_flags
}

lsp.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lsp.tailwindcss.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lsp.cssls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lsp.html.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

lsp.tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lsp.rescriptls.setup {
  on_attach = on_attach,
  flags = lsp_flags
}

lsp.rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
        ['rust-analyzer'] = {}
  }
}
