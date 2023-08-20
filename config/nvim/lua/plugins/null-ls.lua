return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local ok, null_ls = pcall(require, 'null-ls')

    if not ok then
      return
    end

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local sources = {
      formatting.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json') or utils.root_has_file('.eslintrc.js')
        end
      }),
      formatting.stylua,
      formatting.rustfmt,
      formatting.prettierd.with({
        condition = function(utils)
          return utils.root_has_file('.prettierrc.json') or utils.root_has_file('.prettierrc.js')
        end
      }),
      -- formatting.phpcsfixer,

      diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json') or utils.root_has_file('.eslintrc.js')
        end
      }),
      diagnostics.shellcheck,
      diagnostics.phpcs,
      -- diagnostics.phpstan,

      code_actions.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json') or utils.root_has_file('.eslintrc.js')
        end
      }),
      code_actions.shellcheck,
    }

    --[[ local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client) return client.name == 'null-ls' end,
        bufnr = bufnr
      })
    end ]]

    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    --[[ local on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function() lsp_formatting(bufnr) end
        })
      end
    end ]]

    null_ls.setup({
      sources = sources
      -- on_attach = on_attach
    })
  end
}
