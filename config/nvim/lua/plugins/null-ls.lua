return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local sources = {
      -- Code actions
      code_actions.eslint_d,
      code_actions.shellcheck,

      -- Diagnostics
      diagnostics.eslint_d,
      diagnostics.shellcheck,

      -- Formatting
      formatting.eslint_d,
      formatting.stylua,
      formatting.rustfmt,
    }

    null_ls.setup({
      sources = sources
    })
  end
}
