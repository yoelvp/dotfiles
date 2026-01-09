return {
  'neovim/nvim-lspconfig',
  config = function()
    local keymap = vim.keymap.set
    local utils = require('yoelvp.utils')
    local ts_builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }

    local new_options = function(new_opts)
      return utils.extend_tbl(opts, new_opts)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),

      callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if not client then
          return
        end

        if client:supports_method('textDocument/definition') then
          vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
        end
        if client:supports_method('textDocument/implementation') then
          vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
        end

        keymap('n', 'gd', vim.lsp.buf.definition, new_options({ desc = 'Go to definition' }))
        keymap('n', 'gr', ts_builtin.lsp_references, new_options({ desc = 'Go to references' }))
        keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', new_options({ desc = 'LSP implementation' }))
        keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', new_options({ desc = 'Rename variables' }))
        keymap('n', 'H', ':lua vim.lsp.buf.hover()<CR>', opts)
        keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
        keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
        keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
        keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)
        keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>',
          new_options({ desc = 'Format document' }))
      end,
    })
  end,
}
