return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local sources = {
      formatting.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json')
        end
      }),
      formatting.stylua,
      formatting.rustfmt,
      formatting.prettierd.with({
        condition = function(utils)
          return utils.root_has_file('.prettierrc.json')
        end
      }),

      diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json')
        end
      }),
      diagnostics.shellcheck,

      code_actions.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json')
        end
      }),
      code_actions.shellcheck,
    }

    null_ls.setup({
      sources = sources
    })
  end
}
