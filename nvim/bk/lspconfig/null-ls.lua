local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.eslint_d,

    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.rustfmt,

    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.eslint_d,

    null_ls.builtins.diagnostics.phpcs.with {
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      condition = function(utils)
        return utils.root_has_file 'phpcs.xml'
      end,
    },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>vca', vim.lsp.buf.code_action, {desc = 'LSP (null ls) Code actions'})
vim.keymap.set('n', '<leader>ff', function()
  return vim.lsp.buf.format { async = true }
end, {desc = 'LSP (null ls) Format file'})

-- function to toogle and possible restart it
vim.api.nvim_create_user_command('NullLsToggle', function()
  local sources = vim.tbl_map(function(el)
    return el.name
  end, null_ls.get_sources())
  vim.ui.select(sources, {}, function(selected)
    if not selected then
      return
    end
    null_ls.toggle(selected)
  end)
end, {})
