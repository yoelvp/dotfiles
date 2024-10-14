return {
  'mfussenegger/nvim-lint',
  enabled = true,
  event = 'BufReadPre',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      svelte = { 'eslint' },
      astro = { 'eslint' }
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymap
    vim.keymap.set('n', '<leader>ln', function()
      lint.try_lint()
    end, { noremap = true, silent = true, desc = 'Trigger linting for current file' })
  end,
}
