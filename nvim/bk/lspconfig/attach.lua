return function(client, bufnr)
  vim.keymap.set('n', '<leader>ff', function()
    return vim.lsp.buf.format {
      async = true,
      filter = function(cli)
        return cli.name ~= 'lua_ls'
      end,
    }
  end, { buffer = 0, desc = 'LSP format file' })

  keymap('n', 'gd', vim.lsp.buf.definition, opts, { desc = 'Go to definition' })
  keymap('n', 'gr', ts_builtin.lsp_references, opts, { desc = 'Go to references' })
  keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts, { desc = 'LSP implementation' })
  keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', opts, { desc = 'Rename variables' })
  keymap('n', 'H', ':lua vim.lsp.buf.hover()<CR>', opts)
  keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
  keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end
